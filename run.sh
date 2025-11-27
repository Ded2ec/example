#!/usr/bin/env bash
set -e

backend() {
  (
    cd backend && npm install && {
      npm run dev || node server.js
    }
  )
}
frontend() { (cd frontend && npm install && npm run dev); }

backend & B=$!
frontend & F=$!

trap "kill $B $F" INT TERM
wait
