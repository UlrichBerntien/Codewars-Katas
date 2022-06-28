# Maps (button state, Pressed button) -> button state.
BUTTON_MAP = {
    (Nothing,Like) : Like,
    (Nothing,Dislike) : Dislike,
    (Like,Like) : Nothing,
    (Like,Dislike) : Dislike,
    (Dislike,Like) : Like,
    (Dislike,Dislike) : Nothing
}

# Function toggle the like/dislike button.
# Argument lst is a list of button press actions.
# Returns the state of the button after all press actions in the list.
def like_or_dislike(lst):
    # Start in Nothing status
    state = Nothing
    for press in lst:
        # Switch status of the button
        state = BUTTON_MAP[(state,press)]
    # Return the last state
    return state
