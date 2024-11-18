#!/bin/bash

set -Eeuo pipefail

exec "ng serve --host 0.0.0.0 --port 4200"
