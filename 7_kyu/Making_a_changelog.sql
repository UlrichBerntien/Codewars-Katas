CREATE FUNCTION documents_insert_log()
RETURNS trigger AS
  $FOO$
  BEGIN
    INSERT INTO documents_changelog(document_id, old_data, new_data)
    VALUES (NEW.id, NULL, NEW.data);
    RETURN NEW;
  END;
  $FOO$
  LANGUAGE plpgsql;

CREATE FUNCTION documents_update_log()
RETURNS trigger AS
  $FOO$
  BEGIN
  IF NEW.data <> OLD.data THEN
      INSERT INTO documents_changelog(document_id, old_data, new_data)
      VALUES (NEW.id, OLD.data, NEW.data);
    END IF;
    RETURN NEW;
  END;
  $FOO$
  LANGUAGE plpgsql;

CREATE FUNCTION documents_delete_log()
RETURNS trigger AS
  $FOO$
  BEGIN
    INSERT INTO documents_changelog(document_id, old_data, new_data)
    VALUES (OLD.id, OLD.data, NULL);
    RETURN OLD;
  END;
  $FOO$
  LANGUAGE plpgsql;


CREATE TRIGGER documents_insert_event
AFTER INSERT
ON documents FOR EACH ROW
EXECUTE PROCEDURE documents_insert_log();

CREATE TRIGGER documents_update_event
AFTER UPDATE
ON documents FOR EACH ROW
EXECUTE PROCEDURE documents_update_log();

CREATE TRIGGER documents_delete_event
AFTER DELETE
ON documents FOR EACH ROW
EXECUTE PROCEDURE documents_delete_log();
