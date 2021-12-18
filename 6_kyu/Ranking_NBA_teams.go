package kata

import (
	"errors"
	"fmt"
	"regexp"
	"strconv"
	"strings"
)

// matchData holds the string encoded results of a match.
type matchData struct {
	team   [2]string
	points [2]string
}

// teamData holds the points scored and conceded in match by a team.
type teamData struct {
	pointsScored, pointsConceded int
}

// The points are given as decimal floating point numbers.
// The points must be the only decimal numbers in the result string.
var patternPoints = regexp.MustCompile(`\b\d+\.?\d*\b`)

// splitMatchData splits the string of one game result into its parts.
// Extracts only the strings.
// Allows floating point numbers as points.
func splitMatchData(game string) (parsed matchData, err error) {
	// The points structed the result string
	indexPoints := patternPoints.FindAllStringIndex(game, -1)
	if indexPoints == nil || len(indexPoints) != 2 {
		err = errors.New("not 2 numbers")
		return
	}
	for id, index := range indexPoints {
		parsed.points[id] = game[index[0]:index[1]]
	}
	parsed.team[0] = strings.TrimSpace(game[0:indexPoints[0][0]])
	parsed.team[1] = strings.TrimSpace(game[indexPoints[0][1]:indexPoints[1][0]])
	return
}

// parsePoints parsed an decimal number.
// Returns float number error if the decimal number is invalid.
func parsePoints(str string) (n int, err error) {
	n, err = strconv.Atoi(str)
	if err != nil {
		err = errors.New("float number")
	}
	return
}

// parseTeamData parses the points of a team.
// The points must be given as integers.
func parseTeamData(str matchData, teamId int) (game teamData, err error) {
	game.pointsScored, err = parsePoints(str.points[teamId])
	if err == nil {
		game.pointsConceded, err = parsePoints(str.points[1-teamId])
	}
	return
}

func NbaCup(resultSheet, toFind string) string {
	if toFind == "" {
		// Special case: empty team must result in an empty string.
		return ""
	}
	// variables to collect game results
	numberMatchesWon := 0
	numberMatchesDrawn := 0
	numberMatchesLost := 0
	totalPointsScored := 0
	totalPointsConceded := 0
	rank := 0
	// Iterate over all games.
	for _, line := range strings.Split(resultSheet, ",") {
		entries, err := splitMatchData(line)
		if err != nil {
			return fmt.Sprintf("Error(%v):%s", err, line)
		}
		var game teamData
		if entries.team[0] == toFind {
			game, err = parseTeamData(entries, 0)
		} else if entries.team[1] == toFind {
			game, err = parseTeamData(entries, 1)
		} else {
			continue
		}
		if err != nil {
			return fmt.Sprintf("Error(%v):%s", err, line)
		}
		// The team to find was in the game. Add the result of the game.
		delta := game.pointsScored - game.pointsConceded
		switch {
		case delta > 0:
			numberMatchesWon++
			rank += 3
		case delta == 0:
			numberMatchesDrawn++
			rank++
		case delta < 0:
			numberMatchesLost++
		}
		totalPointsScored += game.pointsScored
		totalPointsConceded += game.pointsConceded
	}
	// Prepare the result string in the given format
	if numberMatchesWon == 0 && numberMatchesDrawn == 0 && numberMatchesLost == 0 {
		return toFind + ":This team didn't play!"
	} else {
		return fmt.Sprintf("%s:W=%d;D=%d;L=%d;Scored=%d;Conceded=%d;Points=%d", toFind, numberMatchesWon, numberMatchesDrawn, numberMatchesLost, totalPointsScored, totalPointsConceded, rank)
	}
}
