#!/bin/bash

middleman build &&
middleman deploy &&
middleman s3_sync
