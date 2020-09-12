#!/bin/sh

release_ctl eval --mfa "RefPA2.DBTasks.migrate/1" --argv -- "$@"
