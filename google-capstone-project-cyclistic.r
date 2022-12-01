{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "45e6f715",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2022-12-01T10:52:32.006749Z",
     "iopub.status.busy": "2022-12-01T10:52:32.004727Z",
     "iopub.status.idle": "2022-12-01T10:52:33.489524Z",
     "shell.execute_reply": "2022-12-01T10:52:33.487576Z"
    },
    "papermill": {
     "duration": 1.497772,
     "end_time": "2022-12-01T10:52:33.492706",
     "exception": false,
     "start_time": "2022-12-01T10:52:31.994934",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.2 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.3.6      \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 0.3.5 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.8      \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.10\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.2.1      \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.4.1 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.1.3      \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.2 \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "'cyclisticdata01'"
      ],
      "text/latex": [
       "'cyclisticdata01'"
      ],
      "text/markdown": [
       "'cyclisticdata01'"
      ],
      "text/plain": [
       "[1] \"cyclisticdata01\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# This R environment comes with many helpful analytics packages installed\n",
    "# It is defined by the kaggle/rstats Docker image: https://github.com/kaggle/docker-rstats\n",
    "# For example, here's a helpful package to load\n",
    "\n",
    "library(tidyverse) # metapackage of all tidyverse packages\n",
    "\n",
    "# Input data files are available in the read-only \"../input/\" directory\n",
    "# For example, running this (by clicking run or pressing Shift+Enter) will list all files under the input directory\n",
    "\n",
    "list.files(path = \"../input\")\n",
    "\n",
    "# You can write up to 20GB to the current directory (/kaggle/working/) that gets preserved as output when you create a version using \"Save & Run All\" \n",
    "# You can also write temporary files to /kaggle/temp/, but they won't be saved outside of the current session"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "f311f006",
   "metadata": {
    "papermill": {
     "duration": 0.006802,
     "end_time": "2022-12-01T10:52:33.506491",
     "exception": false,
     "start_time": "2022-12-01T10:52:33.499689",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Loading Libraries required for Analysis**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "5206f2d8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-01T10:52:33.551123Z",
     "iopub.status.busy": "2022-12-01T10:52:33.521668Z",
     "iopub.status.idle": "2022-12-01T10:53:38.514204Z",
     "shell.execute_reply": "2022-12-01T10:53:38.512263Z"
    },
    "papermill": {
     "duration": 65.005383,
     "end_time": "2022-12-01T10:53:38.518511",
     "exception": false,
     "start_time": "2022-12-01T10:52:33.513128",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n",
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n",
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n",
      "\n",
      "Attaching package: ‘data.table’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:dplyr’:\n",
      "\n",
      "    between, first, last\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:purrr’:\n",
      "\n",
      "    transpose\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "install.packages(\"tidyverse\")\n",
    "install.packages(\"hms\")\n",
    "install.packages(\"data.table\")\n",
    "library(tidyverse)\n",
    "library(hms)\n",
    "library(data.table)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "aee4e898",
   "metadata": {
    "papermill": {
     "duration": 0.007206,
     "end_time": "2022-12-01T10:53:38.532674",
     "exception": false,
     "start_time": "2022-12-01T10:53:38.525468",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**#load original .csv files, a years worth of data from November 2021 to October 2022**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "f26c7704",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-01T10:53:38.550178Z",
     "iopub.status.busy": "2022-12-01T10:53:38.548637Z",
     "iopub.status.idle": "2022-12-01T10:54:09.229253Z",
     "shell.execute_reply": "2022-12-01T10:54:09.227322Z"
    },
    "papermill": {
     "duration": 30.692384,
     "end_time": "2022-12-01T10:54:09.232017",
     "exception": false,
     "start_time": "2022-12-01T10:53:38.539633",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m359978\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m247540\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m103770\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m115609\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m284042\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m371249\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m634858\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m769204\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m823488\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m785932\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m701339\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m558685\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    }
   ],
   "source": [
    "nov21_df <- read_csv(\"/kaggle/input/cyclisticdata01/November-2021.csv\")\n",
    "dec21_df <- read_csv(\"/kaggle/input/cyclisticdata01/December-2021.csv\")\n",
    "jan22_df <- read_csv(\"/kaggle/input/cyclisticdata01/January-2022.csv\")\n",
    "feb22_df <- read_csv(\"/kaggle/input/cyclisticdata01/February-2022.csv\")\n",
    "mar22_df <- read_csv(\"/kaggle/input/cyclisticdata01/March-2022.csv\")\n",
    "apr22_df <- read_csv(\"/kaggle/input/cyclisticdata01/April-2022.csv\")\n",
    "may22_df <- read_csv(\"/kaggle/input/cyclisticdata01/May-2022.csv\")\n",
    "jun22_df <- read_csv(\"/kaggle/input/cyclisticdata01/June-2022.csv\")\n",
    "jul22_df <- read_csv(\"/kaggle/input/cyclisticdata01/July-2022.csv\")\n",
    "aug22_df <- read_csv(\"/kaggle/input/cyclisticdata01/August-2022.csv\")\n",
    "sep22_df <- read_csv(\"/kaggle/input/cyclisticdata01/September-2022.csv\")\n",
    "oct22_df <- read_csv(\"/kaggle/input/cyclisticdata01/October-2022.csv\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4e301764",
   "metadata": {
    "papermill": {
     "duration": 0.009335,
     "end_time": "2022-12-01T10:54:09.250975",
     "exception": false,
     "start_time": "2022-12-01T10:54:09.241640",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**#Merge all of the data frames into one year view**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "15985f79",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-01T10:54:09.272498Z",
     "iopub.status.busy": "2022-12-01T10:54:09.271013Z",
     "iopub.status.idle": "2022-12-01T10:54:23.270753Z",
     "shell.execute_reply": "2022-12-01T10:54:23.269007Z"
    },
    "papermill": {
     "duration": 14.013374,
     "end_time": "2022-12-01T10:54:23.273352",
     "exception": false,
     "start_time": "2022-12-01T10:54:09.259978",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "cyclistic_df <- rbind(nov21_df,dec21_df,jan22_df,feb22_df, mar22_df, apr22_df, may22_df, jun22_df, jul22_df, aug22_df, sep22_df, oct22_df)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3dd27415",
   "metadata": {
    "papermill": {
     "duration": 0.010908,
     "end_time": "2022-12-01T10:54:23.293410",
     "exception": false,
     "start_time": "2022-12-01T10:54:23.282502",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**#Remove individual month data frames to clear up space in the environment**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "eab018f2",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-01T10:54:23.316040Z",
     "iopub.status.busy": "2022-12-01T10:54:23.314537Z",
     "iopub.status.idle": "2022-12-01T10:54:23.328307Z",
     "shell.execute_reply": "2022-12-01T10:54:23.326613Z"
    },
    "papermill": {
     "duration": 0.027903,
     "end_time": "2022-12-01T10:54:23.330768",
     "exception": false,
     "start_time": "2022-12-01T10:54:23.302865",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "remove(nov21_df, dec21_df, jan22_df, feb22_df, mar22_df, apr22_df, may22_df, jun22_df, jul22_df, aug22_df, sep22_df, oct22_df)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "961a8dd7",
   "metadata": {
    "papermill": {
     "duration": 0.009659,
     "end_time": "2022-12-01T10:54:23.349892",
     "exception": false,
     "start_time": "2022-12-01T10:54:23.340233",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**#create new data frame to contain new columns**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "7ab6a0c6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-01T10:54:23.372302Z",
     "iopub.status.busy": "2022-12-01T10:54:23.370785Z",
     "iopub.status.idle": "2022-12-01T10:54:23.385191Z",
     "shell.execute_reply": "2022-12-01T10:54:23.383514Z"
    },
    "papermill": {
     "duration": 0.029158,
     "end_time": "2022-12-01T10:54:23.388473",
     "exception": false,
     "start_time": "2022-12-01T10:54:23.359315",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "cyclistic_data <- cyclistic_df"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "80cc3126",
   "metadata": {
    "papermill": {
     "duration": 0.00963,
     "end_time": "2022-12-01T10:54:23.407446",
     "exception": false,
     "start_time": "2022-12-01T10:54:23.397816",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**#calculate ride length by subtracting ended_at time from started_at time and converted it to minutes**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "e0b98d76",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-01T10:54:23.429672Z",
     "iopub.status.busy": "2022-12-01T10:54:23.428070Z",
     "iopub.status.idle": "2022-12-01T10:54:23.511147Z",
     "shell.execute_reply": "2022-12-01T10:54:23.509378Z"
    },
    "papermill": {
     "duration": 0.096743,
     "end_time": "2022-12-01T10:54:23.513479",
     "exception": false,
     "start_time": "2022-12-01T10:54:23.416736",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "cyclistic_data$ride_length <- difftime(cyclistic_df$ended_at, cyclistic_df$started_at, units = \"mins\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "79954885",
   "metadata": {
    "papermill": {
     "duration": 0.009209,
     "end_time": "2022-12-01T10:54:23.531784",
     "exception": false,
     "start_time": "2022-12-01T10:54:23.522575",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**#create columnds for: day of week, month, day, year, time, hour**\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "be553979",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-01T10:54:23.553525Z",
     "iopub.status.busy": "2022-12-01T10:54:23.551964Z",
     "iopub.status.idle": "2022-12-01T10:54:37.654204Z",
     "shell.execute_reply": "2022-12-01T10:54:37.652452Z"
    },
    "papermill": {
     "duration": 14.116229,
     "end_time": "2022-12-01T10:54:37.657023",
     "exception": false,
     "start_time": "2022-12-01T10:54:23.540794",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "cyclistic_data$date <- as.Date(cyclistic_data$started_at) #default format is yyyy-mm-dd, use start date\n",
    "cyclistic_data$day_of_week <- wday(cyclistic_df$started_at) #calculate the day of the week \n",
    "cyclistic_data$day_of_week <- format(as.Date(cyclistic_data$date), \"%A\") #create column for day of week\n",
    "cyclistic_data$month <- format(as.Date(cyclistic_data$date), \"%m\")#create column for month\n",
    "cyclistic_data$day <- format(as.Date(cyclistic_data$date), \"%d\") #create column for day\n",
    "cyclistic_data$year <- format(as.Date(cyclistic_data$date), \"%Y\") #create column for year\n",
    "cyclistic_data$time <- format(as.Date(cyclistic_data$date), \"%H:%M:%S\") #format time as HH:MM:SS\n",
    "cyclistic_data$time <- as_hms((cyclistic_df$started_at)) #create new column for time\n",
    "cyclistic_data$hour <- hour(cyclistic_data$time) #create new column for hour"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "0b6d9b26",
   "metadata": {
    "papermill": {
     "duration": 0.009333,
     "end_time": "2022-12-01T10:54:37.675475",
     "exception": false,
     "start_time": "2022-12-01T10:54:37.666142",
     "status": "completed"
    },
    "tags": []
   },
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "8b5166c6",
   "metadata": {
    "papermill": {
     "duration": 0.014904,
     "end_time": "2022-12-01T10:54:37.699421",
     "exception": false,
     "start_time": "2022-12-01T10:54:37.684517",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**#create column for different seasons: Spring, Summer, Fall, Winter**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "20d293c9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-01T10:54:37.721575Z",
     "iopub.status.busy": "2022-12-01T10:54:37.720072Z",
     "iopub.status.idle": "2022-12-01T10:54:42.177060Z",
     "shell.execute_reply": "2022-12-01T10:54:42.175262Z"
    },
    "papermill": {
     "duration": 4.470963,
     "end_time": "2022-12-01T10:54:42.180132",
     "exception": false,
     "start_time": "2022-12-01T10:54:37.709169",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "cyclistic_data <-cyclistic_data %>% mutate(season = \n",
    "                                             case_when(month == \"03\" ~ \"Spring\",\n",
    "                                                       month == \"04\" ~ \"Spring\",\n",
    "                                                       month == \"05\" ~ \"Spring\",\n",
    "                                                       month == \"06\"  ~ \"Summer\",\n",
    "                                                       month == \"07\"  ~ \"Summer\",\n",
    "                                                       month == \"08\"  ~ \"Summer\",\n",
    "                                                       month == \"09\" ~ \"Fall\",\n",
    "                                                       month == \"10\" ~ \"Fall\",\n",
    "                                                       month == \"11\" ~ \"Fall\",\n",
    "                                                       month == \"12\" ~ \"Winter\",\n",
    "                                                       month == \"01\" ~ \"Winter\",\n",
    "                                                       month == \"02\" ~ \"Winter\")\n",
    ")\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "f3027045",
   "metadata": {
    "papermill": {
     "duration": 0.012397,
     "end_time": "2022-12-01T10:54:42.206242",
     "exception": false,
     "start_time": "2022-12-01T10:54:42.193845",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**#create column for different time_of_day: Night, Morning, Afternoon, Evening**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "eb084187",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-01T10:54:42.233784Z",
     "iopub.status.busy": "2022-12-01T10:54:42.231544Z",
     "iopub.status.idle": "2022-12-01T10:54:55.015036Z",
     "shell.execute_reply": "2022-12-01T10:54:55.013360Z"
    },
    "papermill": {
     "duration": 12.799101,
     "end_time": "2022-12-01T10:54:55.017641",
     "exception": false,
     "start_time": "2022-12-01T10:54:42.218540",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "cyclistic_data <-cyclistic_data %>% mutate(time_of_day = \n",
    "                                             case_when(hour == \"0\" ~ \"Night\",\n",
    "                                                       hour == \"1\" ~ \"Night\",\n",
    "                                                       hour == \"2\" ~ \"Night\",\n",
    "                                                       hour == \"3\" ~ \"Night\",\n",
    "                                                       hour == \"4\" ~ \"Night\",\n",
    "                                                       hour == \"5\" ~ \"Night\",\n",
    "                                                       hour == \"6\" ~ \"Morning\",\n",
    "                                                       hour == \"7\" ~ \"Morning\",\n",
    "                                                       hour == \"8\" ~ \"Morning\",\n",
    "                                                       hour == \"9\" ~ \"Morning\",\n",
    "                                                       hour == \"10\" ~ \"Morning\",\n",
    "                                                       hour == \"11\" ~ \"Morning\",\n",
    "                                                       hour == \"12\" ~ \"Afternoon\",\n",
    "                                                       hour == \"13\" ~ \"Afternoon\",\n",
    "                                                       hour == \"14\" ~ \"Afternoon\",\n",
    "                                                       hour == \"15\" ~ \"Afternoon\",\n",
    "                                                       hour == \"16\" ~ \"Afternoon\",\n",
    "                                                       hour == \"17\" ~ \"Afternoon\",\n",
    "                                                       hour == \"18\" ~ \"Evening\",\n",
    "                                                       hour == \"19\" ~ \"Evening\",\n",
    "                                                       hour == \"20\" ~ \"Evening\",\n",
    "                                                       hour == \"21\" ~ \"Evening\",\n",
    "                                                       hour == \"22\" ~ \"Evening\",\n",
    "                                                       hour == \"23\" ~ \"Evening\")\n",
    ")\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "aa448067",
   "metadata": {
    "papermill": {
     "duration": 0.009277,
     "end_time": "2022-12-01T10:54:55.036055",
     "exception": false,
     "start_time": "2022-12-01T10:54:55.026778",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**#clean the data**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "d447c755",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-01T10:54:55.057636Z",
     "iopub.status.busy": "2022-12-01T10:54:55.056100Z",
     "iopub.status.idle": "2022-12-01T10:55:05.826352Z",
     "shell.execute_reply": "2022-12-01T10:55:05.824594Z"
    },
    "papermill": {
     "duration": 10.783959,
     "end_time": "2022-12-01T10:55:05.828977",
     "exception": false,
     "start_time": "2022-12-01T10:54:55.045018",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "cyclistic_data <- na.omit(cyclistic_data) #remove rows with NA values\n",
    "cyclistic_data <- distinct(cyclistic_data) #remove duplicate rows \n",
    "cyclistic_data <- cyclistic_data[!(cyclistic_data$ride_length <=0),] #remove where ride_length is 0 or negative\n",
    "cyclistic_data <- cyclistic_data %>%  #remove columns not needed: ride_id, start_station_id, end_station_id, start_lat, start_long, end_lat, end_lng\n",
    "  select(-c(ride_id, start_station_id, end_station_id,start_lat,start_lng,end_lat,end_lng)) "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "5e53c34d",
   "metadata": {
    "papermill": {
     "duration": 0.009388,
     "end_time": "2022-12-01T10:55:05.847896",
     "exception": false,
     "start_time": "2022-12-01T10:55:05.838508",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**#view the final data**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "7c37ba1b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-01T10:55:05.870075Z",
     "iopub.status.busy": "2022-12-01T10:55:05.868686Z",
     "iopub.status.idle": "2022-12-01T10:55:06.026642Z",
     "shell.execute_reply": "2022-12-01T10:55:06.025016Z"
    },
    "papermill": {
     "duration": 0.172085,
     "end_time": "2022-12-01T10:55:06.029522",
     "exception": false,
     "start_time": "2022-12-01T10:55:05.857437",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 4410143 × 16</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>end_station_name</th><th scope=col>member_casual</th><th scope=col>ride_length</th><th scope=col>date</th><th scope=col>day_of_week</th><th scope=col>month</th><th scope=col>day</th><th scope=col>year</th><th scope=col>time</th><th scope=col>hour</th><th scope=col>season</th><th scope=col>time_of_day</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;time&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>classic_bike </td><td>2021-11-26 10:27:28</td><td>2021-11-26 11:22:13</td><td><span style=white-space:pre-wrap>Michigan Ave &amp; Oak St      </span></td><td><span style=white-space:pre-wrap>Michigan Ave &amp; Oak St      </span></td><td>casual</td><td> 54.7500000 mins</td><td>2021-11-26</td><td><span style=white-space:pre-wrap>Friday   </span></td><td>11</td><td>26</td><td>2021</td><td>10:27:28</td><td>10</td><td>Fall</td><td><span style=white-space:pre-wrap>Morning  </span></td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2021-11-15 09:35:03</td><td>2021-11-15 09:42:08</td><td><span style=white-space:pre-wrap>Clark St &amp; Grace St        </span></td><td><span style=white-space:pre-wrap>Clark St &amp; Leland Ave      </span></td><td>casual</td><td><span style=white-space:pre-wrap>  7.0833333 mins</span></td><td>2021-11-15</td><td><span style=white-space:pre-wrap>Monday   </span></td><td>11</td><td>15</td><td>2021</td><td>09:35:03</td><td> 9</td><td>Fall</td><td><span style=white-space:pre-wrap>Morning  </span></td></tr>\n",
       "\t<tr><td>electric_bike</td><td>2021-11-10 16:27:02</td><td>2021-11-10 17:04:28</td><td>Leamington Ave &amp; Hirsch St </td><td>Leamington Ave &amp; Hirsch St </td><td>casual</td><td> 37.4333333 mins</td><td>2021-11-10</td><td>Wednesday</td><td>11</td><td>10</td><td>2021</td><td>16:27:02</td><td>16</td><td>Fall</td><td>Afternoon</td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2021-11-09 19:51:36</td><td>2021-11-09 20:11:17</td><td><span style=white-space:pre-wrap>Desplaines St &amp; Kinzie St  </span></td><td><span style=white-space:pre-wrap>Desplaines St &amp; Kinzie St  </span></td><td>casual</td><td> 19.6833333 mins</td><td>2021-11-09</td><td><span style=white-space:pre-wrap>Tuesday  </span></td><td>11</td><td>09</td><td>2021</td><td>19:51:36</td><td>19</td><td>Fall</td><td><span style=white-space:pre-wrap>Evening  </span></td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2021-11-06 19:14:10</td><td>2021-11-06 19:33:19</td><td>Larrabee St &amp; Armitage Ave </td><td><span style=white-space:pre-wrap>Michigan Ave &amp; Oak St      </span></td><td>casual</td><td> 19.1500000 mins</td><td>2021-11-06</td><td>Saturday </td><td>11</td><td>06</td><td>2021</td><td>19:14:10</td><td>19</td><td>Fall</td><td><span style=white-space:pre-wrap>Evening  </span></td></tr>\n",
       "\t<tr><td>electric_bike</td><td>2021-11-18 11:58:24</td><td>2021-11-18 12:08:35</td><td><span style=white-space:pre-wrap>Michigan Ave &amp; Oak St      </span></td><td><span style=white-space:pre-wrap>Michigan Ave &amp; Oak St      </span></td><td>casual</td><td> 10.1833333 mins</td><td>2021-11-18</td><td>Thursday </td><td>11</td><td>18</td><td>2021</td><td>11:58:24</td><td>11</td><td>Fall</td><td><span style=white-space:pre-wrap>Morning  </span></td></tr>\n",
       "\t<tr><td>electric_bike</td><td>2021-11-23 22:14:11</td><td>2021-11-23 22:44:01</td><td>Sheridan Rd &amp; Noyes St (NU)</td><td>Sheridan Rd &amp; Noyes St (NU)</td><td>casual</td><td> 29.8333333 mins</td><td>2021-11-23</td><td><span style=white-space:pre-wrap>Tuesday  </span></td><td>11</td><td>23</td><td>2021</td><td>22:14:11</td><td>22</td><td>Fall</td><td><span style=white-space:pre-wrap>Evening  </span></td></tr>\n",
       "\t<tr><td>electric_bike</td><td>2021-11-05 16:48:10</td><td>2021-11-05 16:53:18</td><td><span style=white-space:pre-wrap>Clark St &amp; Grace St        </span></td><td><span style=white-space:pre-wrap>Clark St &amp; Leland Ave      </span></td><td>member</td><td><span style=white-space:pre-wrap>  5.1333333 mins</span></td><td>2021-11-05</td><td><span style=white-space:pre-wrap>Friday   </span></td><td>11</td><td>05</td><td>2021</td><td>16:48:10</td><td>16</td><td>Fall</td><td>Afternoon</td></tr>\n",
       "\t<tr><td>electric_bike</td><td>2021-11-18 08:40:38</td><td>2021-11-18 08:48:56</td><td><span style=white-space:pre-wrap>Desplaines St &amp; Kinzie St  </span></td><td><span style=white-space:pre-wrap>Dearborn St &amp; Monroe St    </span></td><td>member</td><td><span style=white-space:pre-wrap>  8.3000000 mins</span></td><td>2021-11-18</td><td>Thursday </td><td>11</td><td>18</td><td>2021</td><td>08:40:38</td><td> 8</td><td>Fall</td><td><span style=white-space:pre-wrap>Morning  </span></td></tr>\n",
       "\t<tr><td>electric_bike</td><td>2021-11-14 20:29:33</td><td>2021-11-14 20:33:13</td><td><span style=white-space:pre-wrap>Kingsbury St &amp; Kinzie St   </span></td><td><span style=white-space:pre-wrap>Desplaines St &amp; Kinzie St  </span></td><td>member</td><td><span style=white-space:pre-wrap>  3.6666667 mins</span></td><td>2021-11-14</td><td><span style=white-space:pre-wrap>Sunday   </span></td><td>11</td><td>14</td><td>2021</td><td>20:29:33</td><td>20</td><td>Fall</td><td><span style=white-space:pre-wrap>Evening  </span></td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2021-11-14 18:36:11</td><td>2021-11-14 18:38:56</td><td><span style=white-space:pre-wrap>Desplaines St &amp; Kinzie St  </span></td><td><span style=white-space:pre-wrap>Kingsbury St &amp; Kinzie St   </span></td><td>member</td><td><span style=white-space:pre-wrap>  2.7500000 mins</span></td><td>2021-11-14</td><td><span style=white-space:pre-wrap>Sunday   </span></td><td>11</td><td>14</td><td>2021</td><td>18:36:11</td><td>18</td><td>Fall</td><td><span style=white-space:pre-wrap>Evening  </span></td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2021-11-28 15:29:12</td><td>2021-11-28 15:29:46</td><td><span style=white-space:pre-wrap>Kingsbury St &amp; Kinzie St   </span></td><td><span style=white-space:pre-wrap>Kingsbury St &amp; Kinzie St   </span></td><td>member</td><td><span style=white-space:pre-wrap>  0.5666667 mins</span></td><td>2021-11-28</td><td><span style=white-space:pre-wrap>Sunday   </span></td><td>11</td><td>28</td><td>2021</td><td>15:29:12</td><td>15</td><td>Fall</td><td>Afternoon</td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2021-11-09 08:25:59</td><td>2021-11-09 08:33:49</td><td><span style=white-space:pre-wrap>Kingsbury St &amp; Kinzie St   </span></td><td><span style=white-space:pre-wrap>Dearborn St &amp; Monroe St    </span></td><td>member</td><td><span style=white-space:pre-wrap>  7.8333333 mins</span></td><td>2021-11-09</td><td><span style=white-space:pre-wrap>Tuesday  </span></td><td>11</td><td>09</td><td>2021</td><td>08:25:59</td><td> 8</td><td>Fall</td><td><span style=white-space:pre-wrap>Morning  </span></td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2021-11-01 14:19:54</td><td>2021-11-01 14:30:38</td><td><span style=white-space:pre-wrap>Dearborn St &amp; Monroe St    </span></td><td><span style=white-space:pre-wrap>Dearborn St &amp; Monroe St    </span></td><td>member</td><td> 10.7333333 mins</td><td>2021-11-01</td><td><span style=white-space:pre-wrap>Monday   </span></td><td>11</td><td>01</td><td>2021</td><td>14:19:54</td><td>14</td><td>Fall</td><td>Afternoon</td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>docked_bike  </span></td><td>2021-11-07 14:39:41</td><td>2021-11-07 16:51:20</td><td><span style=white-space:pre-wrap>Michigan Ave &amp; Oak St      </span></td><td><span style=white-space:pre-wrap>Michigan Ave &amp; Oak St      </span></td><td>casual</td><td>131.6500000 mins</td><td>2021-11-07</td><td><span style=white-space:pre-wrap>Sunday   </span></td><td>11</td><td>07</td><td>2021</td><td>14:39:41</td><td>14</td><td>Fall</td><td>Afternoon</td></tr>\n",
       "\t<tr><td>electric_bike</td><td>2021-11-08 14:46:14</td><td>2021-11-08 14:51:45</td><td><span style=white-space:pre-wrap>Clark St &amp; Grace St        </span></td><td><span style=white-space:pre-wrap>Clark St &amp; Leland Ave      </span></td><td>member</td><td><span style=white-space:pre-wrap>  5.5166667 mins</span></td><td>2021-11-08</td><td><span style=white-space:pre-wrap>Monday   </span></td><td>11</td><td>08</td><td>2021</td><td>14:46:14</td><td>14</td><td>Fall</td><td>Afternoon</td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2021-11-08 13:51:35</td><td>2021-11-08 13:57:13</td><td><span style=white-space:pre-wrap>Kingsbury St &amp; Kinzie St   </span></td><td><span style=white-space:pre-wrap>Kingsbury St &amp; Kinzie St   </span></td><td>member</td><td><span style=white-space:pre-wrap>  5.6333333 mins</span></td><td>2021-11-08</td><td><span style=white-space:pre-wrap>Monday   </span></td><td>11</td><td>08</td><td>2021</td><td>13:51:35</td><td>13</td><td>Fall</td><td>Afternoon</td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2021-11-05 16:14:05</td><td>2021-11-05 16:24:45</td><td><span style=white-space:pre-wrap>Dearborn St &amp; Monroe St    </span></td><td><span style=white-space:pre-wrap>Kingsbury St &amp; Kinzie St   </span></td><td>member</td><td> 10.6666667 mins</td><td>2021-11-05</td><td><span style=white-space:pre-wrap>Friday   </span></td><td>11</td><td>05</td><td>2021</td><td>16:14:05</td><td>16</td><td>Fall</td><td>Afternoon</td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2021-11-11 17:54:18</td><td>2021-11-11 17:57:40</td><td><span style=white-space:pre-wrap>Desplaines St &amp; Kinzie St  </span></td><td><span style=white-space:pre-wrap>Kingsbury St &amp; Kinzie St   </span></td><td>member</td><td><span style=white-space:pre-wrap>  3.3666667 mins</span></td><td>2021-11-11</td><td>Thursday </td><td>11</td><td>11</td><td>2021</td><td>17:54:18</td><td>17</td><td>Fall</td><td>Afternoon</td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2021-11-13 19:41:36</td><td>2021-11-13 19:44:39</td><td><span style=white-space:pre-wrap>Kingsbury St &amp; Kinzie St   </span></td><td><span style=white-space:pre-wrap>Desplaines St &amp; Kinzie St  </span></td><td>member</td><td><span style=white-space:pre-wrap>  3.0500000 mins</span></td><td>2021-11-13</td><td>Saturday </td><td>11</td><td>13</td><td>2021</td><td>19:41:36</td><td>19</td><td>Fall</td><td><span style=white-space:pre-wrap>Evening  </span></td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2021-11-05 17:33:40</td><td>2021-11-05 17:37:34</td><td><span style=white-space:pre-wrap>Desplaines St &amp; Kinzie St  </span></td><td><span style=white-space:pre-wrap>Kingsbury St &amp; Kinzie St   </span></td><td>member</td><td><span style=white-space:pre-wrap>  3.9000000 mins</span></td><td>2021-11-05</td><td><span style=white-space:pre-wrap>Friday   </span></td><td>11</td><td>05</td><td>2021</td><td>17:33:40</td><td>17</td><td>Fall</td><td>Afternoon</td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2021-11-04 07:30:25</td><td>2021-11-04 07:33:24</td><td><span style=white-space:pre-wrap>Kingsbury St &amp; Kinzie St   </span></td><td><span style=white-space:pre-wrap>Desplaines St &amp; Kinzie St  </span></td><td>member</td><td><span style=white-space:pre-wrap>  2.9833333 mins</span></td><td>2021-11-04</td><td>Thursday </td><td>11</td><td>04</td><td>2021</td><td>07:30:25</td><td> 7</td><td>Fall</td><td><span style=white-space:pre-wrap>Morning  </span></td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2021-11-11 10:56:12</td><td>2021-11-11 10:59:07</td><td><span style=white-space:pre-wrap>Kingsbury St &amp; Kinzie St   </span></td><td><span style=white-space:pre-wrap>Desplaines St &amp; Kinzie St  </span></td><td>member</td><td><span style=white-space:pre-wrap>  2.9166667 mins</span></td><td>2021-11-11</td><td>Thursday </td><td>11</td><td>11</td><td>2021</td><td>10:56:12</td><td>10</td><td>Fall</td><td><span style=white-space:pre-wrap>Morning  </span></td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2021-11-04 18:00:47</td><td>2021-11-04 18:23:35</td><td><span style=white-space:pre-wrap>Dearborn St &amp; Monroe St    </span></td><td>Larrabee St &amp; Armitage Ave </td><td>member</td><td> 22.8000000 mins</td><td>2021-11-04</td><td>Thursday </td><td>11</td><td>04</td><td>2021</td><td>18:00:47</td><td>18</td><td>Fall</td><td><span style=white-space:pre-wrap>Evening  </span></td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2021-11-15 20:04:24</td><td>2021-11-15 20:06:44</td><td><span style=white-space:pre-wrap>Kingsbury St &amp; Kinzie St   </span></td><td><span style=white-space:pre-wrap>Desplaines St &amp; Kinzie St  </span></td><td>member</td><td><span style=white-space:pre-wrap>  2.3333333 mins</span></td><td>2021-11-15</td><td><span style=white-space:pre-wrap>Monday   </span></td><td>11</td><td>15</td><td>2021</td><td>20:04:24</td><td>20</td><td>Fall</td><td><span style=white-space:pre-wrap>Evening  </span></td></tr>\n",
       "\t<tr><td>electric_bike</td><td>2021-11-01 15:49:36</td><td>2021-11-01 15:50:42</td><td><span style=white-space:pre-wrap>Kingsbury St &amp; Kinzie St   </span></td><td><span style=white-space:pre-wrap>Kingsbury St &amp; Kinzie St   </span></td><td>member</td><td><span style=white-space:pre-wrap>  1.1000000 mins</span></td><td>2021-11-01</td><td><span style=white-space:pre-wrap>Monday   </span></td><td>11</td><td>01</td><td>2021</td><td>15:49:36</td><td>15</td><td>Fall</td><td>Afternoon</td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2021-11-16 19:01:36</td><td>2021-11-16 19:04:39</td><td><span style=white-space:pre-wrap>Desplaines St &amp; Kinzie St  </span></td><td><span style=white-space:pre-wrap>Kingsbury St &amp; Kinzie St   </span></td><td>member</td><td><span style=white-space:pre-wrap>  3.0500000 mins</span></td><td>2021-11-16</td><td><span style=white-space:pre-wrap>Tuesday  </span></td><td>11</td><td>16</td><td>2021</td><td>19:01:36</td><td>19</td><td>Fall</td><td><span style=white-space:pre-wrap>Evening  </span></td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2021-11-15 18:53:47</td><td>2021-11-15 18:56:59</td><td><span style=white-space:pre-wrap>Desplaines St &amp; Kinzie St  </span></td><td><span style=white-space:pre-wrap>Kingsbury St &amp; Kinzie St   </span></td><td>member</td><td><span style=white-space:pre-wrap>  3.2000000 mins</span></td><td>2021-11-15</td><td><span style=white-space:pre-wrap>Monday   </span></td><td>11</td><td>15</td><td>2021</td><td>18:53:47</td><td>18</td><td>Fall</td><td><span style=white-space:pre-wrap>Evening  </span></td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2021-11-15 20:51:53</td><td>2021-11-15 20:55:04</td><td><span style=white-space:pre-wrap>Kingsbury St &amp; Kinzie St   </span></td><td><span style=white-space:pre-wrap>Desplaines St &amp; Kinzie St  </span></td><td>member</td><td><span style=white-space:pre-wrap>  3.1833333 mins</span></td><td>2021-11-15</td><td><span style=white-space:pre-wrap>Monday   </span></td><td>11</td><td>15</td><td>2021</td><td>20:51:53</td><td>20</td><td>Fall</td><td><span style=white-space:pre-wrap>Evening  </span></td></tr>\n",
       "\t<tr><td>electric_bike</td><td>2021-11-28 14:18:18</td><td>2021-11-28 14:19:24</td><td><span style=white-space:pre-wrap>Kingsbury St &amp; Kinzie St   </span></td><td><span style=white-space:pre-wrap>Kingsbury St &amp; Kinzie St   </span></td><td>member</td><td><span style=white-space:pre-wrap>  1.1000000 mins</span></td><td>2021-11-28</td><td><span style=white-space:pre-wrap>Sunday   </span></td><td>11</td><td>28</td><td>2021</td><td>14:18:18</td><td>14</td><td>Fall</td><td>Afternoon</td></tr>\n",
       "\t<tr><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2022-10-15 14:25:55</td><td>2022-10-15 14:43:59</td><td><span style=white-space:pre-wrap>Clark St &amp; Wellington Ave      </span></td><td><span style=white-space:pre-wrap>Damen Ave &amp; Clybourn Ave   </span></td><td>member</td><td>18.066667 mins</td><td>2022-10-15</td><td>Saturday </td><td>10</td><td>15</td><td>2022</td><td>14:25:55</td><td>14</td><td>Fall</td><td>Afternoon</td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2022-10-22 11:45:36</td><td>2022-10-22 12:08:05</td><td><span style=white-space:pre-wrap>Clark St &amp; Armitage Ave        </span></td><td><span style=white-space:pre-wrap>Wabash Ave &amp; Grand Ave     </span></td><td>casual</td><td>22.483333 mins</td><td>2022-10-22</td><td>Saturday </td><td>10</td><td>22</td><td>2022</td><td>11:45:36</td><td>11</td><td>Fall</td><td><span style=white-space:pre-wrap>Morning  </span></td></tr>\n",
       "\t<tr><td>electric_bike</td><td>2022-10-09 08:46:51</td><td>2022-10-09 09:23:25</td><td><span style=white-space:pre-wrap>Clark St &amp; Armitage Ave        </span></td><td><span style=white-space:pre-wrap>Wabash Ave &amp; Grand Ave     </span></td><td>casual</td><td>36.566667 mins</td><td>2022-10-09</td><td><span style=white-space:pre-wrap>Sunday   </span></td><td>10</td><td>09</td><td>2022</td><td>08:46:51</td><td> 8</td><td>Fall</td><td><span style=white-space:pre-wrap>Morning  </span></td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2022-10-29 10:32:34</td><td>2022-10-29 11:26:06</td><td><span style=white-space:pre-wrap>Rush St &amp; Hubbard St           </span></td><td><span style=white-space:pre-wrap>Wabash Ave &amp; Grand Ave     </span></td><td>casual</td><td>53.533333 mins</td><td>2022-10-29</td><td>Saturday </td><td>10</td><td>29</td><td>2022</td><td>10:32:34</td><td>10</td><td>Fall</td><td><span style=white-space:pre-wrap>Morning  </span></td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2022-10-19 15:07:34</td><td>2022-10-19 15:32:58</td><td><span style=white-space:pre-wrap>Clark St &amp; Wellington Ave      </span></td><td><span style=white-space:pre-wrap>Wabash Ave &amp; Grand Ave     </span></td><td>member</td><td>25.400000 mins</td><td>2022-10-19</td><td>Wednesday</td><td>10</td><td>19</td><td>2022</td><td>15:07:34</td><td>15</td><td>Fall</td><td>Afternoon</td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2022-10-30 11:41:59</td><td>2022-10-30 12:00:21</td><td><span style=white-space:pre-wrap>Clark St &amp; Armitage Ave        </span></td><td><span style=white-space:pre-wrap>Damen Ave &amp; Clybourn Ave   </span></td><td>member</td><td>18.366667 mins</td><td>2022-10-30</td><td><span style=white-space:pre-wrap>Sunday   </span></td><td>10</td><td>30</td><td>2022</td><td>11:41:59</td><td>11</td><td>Fall</td><td><span style=white-space:pre-wrap>Morning  </span></td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2022-10-18 21:56:49</td><td>2022-10-18 21:57:40</td><td><span style=white-space:pre-wrap>Clark St &amp; Wellington Ave      </span></td><td><span style=white-space:pre-wrap>Lincoln Ave &amp; Roscoe St*   </span></td><td>member</td><td> 0.850000 mins</td><td>2022-10-18</td><td><span style=white-space:pre-wrap>Tuesday  </span></td><td>10</td><td>18</td><td>2022</td><td>21:56:49</td><td>21</td><td>Fall</td><td><span style=white-space:pre-wrap>Evening  </span></td></tr>\n",
       "\t<tr><td>electric_bike</td><td>2022-10-05 13:18:15</td><td>2022-10-05 13:23:19</td><td><span style=white-space:pre-wrap>Clark St &amp; Jarvis Ave          </span></td><td><span style=white-space:pre-wrap>Clark St &amp; Schreiber Ave   </span></td><td>member</td><td> 5.066667 mins</td><td>2022-10-05</td><td>Wednesday</td><td>10</td><td>05</td><td>2022</td><td>13:18:15</td><td>13</td><td>Fall</td><td>Afternoon</td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2022-10-18 14:30:58</td><td>2022-10-18 14:45:43</td><td><span style=white-space:pre-wrap>Clark St &amp; Armitage Ave        </span></td><td><span style=white-space:pre-wrap>Wabash Ave &amp; Grand Ave     </span></td><td>member</td><td>14.750000 mins</td><td>2022-10-18</td><td><span style=white-space:pre-wrap>Tuesday  </span></td><td>10</td><td>18</td><td>2022</td><td>14:30:58</td><td>14</td><td>Fall</td><td>Afternoon</td></tr>\n",
       "\t<tr><td>electric_bike</td><td>2022-10-28 13:22:41</td><td>2022-10-28 13:31:31</td><td><span style=white-space:pre-wrap>Clark St &amp; Armitage Ave        </span></td><td><span style=white-space:pre-wrap>Wabash Ave &amp; Grand Ave     </span></td><td>member</td><td> 8.833333 mins</td><td>2022-10-28</td><td><span style=white-space:pre-wrap>Friday   </span></td><td>10</td><td>28</td><td>2022</td><td>13:22:41</td><td>13</td><td>Fall</td><td>Afternoon</td></tr>\n",
       "\t<tr><td>electric_bike</td><td>2022-10-30 16:35:18</td><td>2022-10-30 16:43:49</td><td><span style=white-space:pre-wrap>Aberdeen St &amp; Jackson Blvd     </span></td><td>Desplaines St &amp; Randolph St</td><td>casual</td><td> 8.516667 mins</td><td>2022-10-30</td><td><span style=white-space:pre-wrap>Sunday   </span></td><td>10</td><td>30</td><td>2022</td><td>16:35:18</td><td>16</td><td>Fall</td><td>Afternoon</td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2022-10-30 23:16:31</td><td>2022-10-30 23:27:09</td><td><span style=white-space:pre-wrap>Halsted St &amp; Roscoe St         </span></td><td><span style=white-space:pre-wrap>Lincoln Ave &amp; Roscoe St*   </span></td><td>casual</td><td>10.633333 mins</td><td>2022-10-30</td><td><span style=white-space:pre-wrap>Sunday   </span></td><td>10</td><td>30</td><td>2022</td><td>23:16:31</td><td>23</td><td>Fall</td><td><span style=white-space:pre-wrap>Evening  </span></td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2022-10-21 08:50:25</td><td>2022-10-21 09:13:02</td><td><span style=white-space:pre-wrap>Sheridan Rd &amp; Montrose Ave     </span></td><td><span style=white-space:pre-wrap>Clark St &amp; Schreiber Ave   </span></td><td>member</td><td>22.616667 mins</td><td>2022-10-21</td><td><span style=white-space:pre-wrap>Friday   </span></td><td>10</td><td>21</td><td>2022</td><td>08:50:25</td><td> 8</td><td>Fall</td><td><span style=white-space:pre-wrap>Morning  </span></td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2022-10-10 17:00:33</td><td>2022-10-10 17:08:31</td><td><span style=white-space:pre-wrap>Aberdeen St &amp; Jackson Blvd     </span></td><td>Desplaines St &amp; Randolph St</td><td>member</td><td> 7.966667 mins</td><td>2022-10-10</td><td><span style=white-space:pre-wrap>Monday   </span></td><td>10</td><td>10</td><td>2022</td><td>17:00:33</td><td>17</td><td>Fall</td><td>Afternoon</td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>docked_bike  </span></td><td>2022-10-22 13:16:48</td><td>2022-10-22 13:46:04</td><td><span style=white-space:pre-wrap>Clark St &amp; Armitage Ave        </span></td><td><span style=white-space:pre-wrap>Wabash Ave &amp; Grand Ave     </span></td><td>casual</td><td>29.266667 mins</td><td>2022-10-22</td><td>Saturday </td><td>10</td><td>22</td><td>2022</td><td>13:16:48</td><td>13</td><td>Fall</td><td>Afternoon</td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2022-10-20 18:21:05</td><td>2022-10-20 18:39:29</td><td><span style=white-space:pre-wrap>Clark St &amp; Armitage Ave        </span></td><td><span style=white-space:pre-wrap>Wabash Ave &amp; Grand Ave     </span></td><td>member</td><td>18.400000 mins</td><td>2022-10-20</td><td>Thursday </td><td>10</td><td>20</td><td>2022</td><td>18:21:05</td><td>18</td><td>Fall</td><td><span style=white-space:pre-wrap>Evening  </span></td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2022-10-07 17:01:45</td><td>2022-10-07 17:07:44</td><td><span style=white-space:pre-wrap>Aberdeen St &amp; Jackson Blvd     </span></td><td>Desplaines St &amp; Randolph St</td><td>member</td><td> 5.983333 mins</td><td>2022-10-07</td><td><span style=white-space:pre-wrap>Friday   </span></td><td>10</td><td>07</td><td>2022</td><td>17:01:45</td><td>17</td><td>Fall</td><td>Afternoon</td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2022-10-28 16:22:14</td><td>2022-10-28 16:37:37</td><td><span style=white-space:pre-wrap>Halsted St &amp; Roscoe St         </span></td><td><span style=white-space:pre-wrap>Damen Ave &amp; Clybourn Ave   </span></td><td>member</td><td>15.383333 mins</td><td>2022-10-28</td><td><span style=white-space:pre-wrap>Friday   </span></td><td>10</td><td>28</td><td>2022</td><td>16:22:14</td><td>16</td><td>Fall</td><td>Afternoon</td></tr>\n",
       "\t<tr><td>electric_bike</td><td>2022-10-01 21:57:14</td><td>2022-10-01 22:27:49</td><td><span style=white-space:pre-wrap>Halsted St &amp; Roscoe St         </span></td><td><span style=white-space:pre-wrap>Wabash Ave &amp; Grand Ave     </span></td><td>casual</td><td>30.583333 mins</td><td>2022-10-01</td><td>Saturday </td><td>10</td><td>01</td><td>2022</td><td>21:57:14</td><td>21</td><td>Fall</td><td><span style=white-space:pre-wrap>Evening  </span></td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2022-10-28 10:54:37</td><td>2022-10-28 11:01:53</td><td>Blackstone Ave &amp; Hyde Park Blvd</td><td><span style=white-space:pre-wrap>Lake Park Ave &amp; 47th St    </span></td><td>member</td><td> 7.266667 mins</td><td>2022-10-28</td><td><span style=white-space:pre-wrap>Friday   </span></td><td>10</td><td>28</td><td>2022</td><td>10:54:37</td><td>10</td><td>Fall</td><td><span style=white-space:pre-wrap>Morning  </span></td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2022-10-22 18:32:35</td><td>2022-10-22 18:45:49</td><td><span style=white-space:pre-wrap>Rush St &amp; Hubbard St           </span></td><td>Desplaines St &amp; Randolph St</td><td>casual</td><td>13.233333 mins</td><td>2022-10-22</td><td>Saturday </td><td>10</td><td>22</td><td>2022</td><td>18:32:35</td><td>18</td><td>Fall</td><td><span style=white-space:pre-wrap>Evening  </span></td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2022-10-19 07:27:19</td><td>2022-10-19 07:40:26</td><td><span style=white-space:pre-wrap>Rush St &amp; Hubbard St           </span></td><td>Desplaines St &amp; Randolph St</td><td>casual</td><td>13.116667 mins</td><td>2022-10-19</td><td>Wednesday</td><td>10</td><td>19</td><td>2022</td><td>07:27:19</td><td> 7</td><td>Fall</td><td><span style=white-space:pre-wrap>Morning  </span></td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>docked_bike  </span></td><td>2022-10-22 13:17:09</td><td>2022-10-22 13:46:18</td><td><span style=white-space:pre-wrap>Clark St &amp; Armitage Ave        </span></td><td><span style=white-space:pre-wrap>Wabash Ave &amp; Grand Ave     </span></td><td>casual</td><td>29.150000 mins</td><td>2022-10-22</td><td>Saturday </td><td>10</td><td>22</td><td>2022</td><td>13:17:09</td><td>13</td><td>Fall</td><td>Afternoon</td></tr>\n",
       "\t<tr><td>electric_bike</td><td>2022-10-16 14:50:27</td><td>2022-10-16 14:53:11</td><td>Blackstone Ave &amp; Hyde Park Blvd</td><td><span style=white-space:pre-wrap>Lake Park Ave &amp; 47th St    </span></td><td>member</td><td> 2.733333 mins</td><td>2022-10-16</td><td><span style=white-space:pre-wrap>Sunday   </span></td><td>10</td><td>16</td><td>2022</td><td>14:50:27</td><td>14</td><td>Fall</td><td>Afternoon</td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2022-10-24 17:45:38</td><td>2022-10-24 17:48:02</td><td><span style=white-space:pre-wrap>Sedgwick St &amp; North Ave        </span></td><td><span style=white-space:pre-wrap>Lincoln Ave &amp; Roscoe St*   </span></td><td>member</td><td> 2.400000 mins</td><td>2022-10-24</td><td><span style=white-space:pre-wrap>Monday   </span></td><td>10</td><td>24</td><td>2022</td><td>17:45:38</td><td>17</td><td>Fall</td><td>Afternoon</td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2022-10-30 01:41:29</td><td>2022-10-30 01:57:16</td><td><span style=white-space:pre-wrap>Clifton Ave &amp; Armitage Ave     </span></td><td><span style=white-space:pre-wrap>Lincoln Ave &amp; Roscoe St*   </span></td><td>casual</td><td>15.783333 mins</td><td>2022-10-30</td><td><span style=white-space:pre-wrap>Sunday   </span></td><td>10</td><td>30</td><td>2022</td><td>01:41:29</td><td> 1</td><td>Fall</td><td><span style=white-space:pre-wrap>Night    </span></td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2022-10-30 01:41:54</td><td>2022-10-30 01:57:09</td><td><span style=white-space:pre-wrap>Clifton Ave &amp; Armitage Ave     </span></td><td><span style=white-space:pre-wrap>Lincoln Ave &amp; Roscoe St*   </span></td><td>casual</td><td>15.250000 mins</td><td>2022-10-30</td><td><span style=white-space:pre-wrap>Sunday   </span></td><td>10</td><td>30</td><td>2022</td><td>01:41:54</td><td> 1</td><td>Fall</td><td><span style=white-space:pre-wrap>Night    </span></td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2022-10-15 09:34:11</td><td>2022-10-15 10:03:21</td><td><span style=white-space:pre-wrap>Sedgwick St &amp; North Ave        </span></td><td><span style=white-space:pre-wrap>Wabash Ave &amp; Grand Ave     </span></td><td>casual</td><td>29.166667 mins</td><td>2022-10-15</td><td>Saturday </td><td>10</td><td>15</td><td>2022</td><td>09:34:11</td><td> 9</td><td>Fall</td><td><span style=white-space:pre-wrap>Morning  </span></td></tr>\n",
       "\t<tr><td>classic_bike </td><td>2022-10-09 10:21:34</td><td>2022-10-09 10:43:45</td><td><span style=white-space:pre-wrap>Sedgwick St &amp; North Ave        </span></td><td><span style=white-space:pre-wrap>Damen Ave &amp; Clybourn Ave   </span></td><td>member</td><td>22.183333 mins</td><td>2022-10-09</td><td><span style=white-space:pre-wrap>Sunday   </span></td><td>10</td><td>09</td><td>2022</td><td>10:21:34</td><td>10</td><td>Fall</td><td><span style=white-space:pre-wrap>Morning  </span></td></tr>\n",
       "\t<tr><td><span style=white-space:pre-wrap>docked_bike  </span></td><td>2022-10-22 13:17:13</td><td>2022-10-22 13:46:14</td><td><span style=white-space:pre-wrap>Clark St &amp; Armitage Ave        </span></td><td><span style=white-space:pre-wrap>Wabash Ave &amp; Grand Ave     </span></td><td>casual</td><td>29.016667 mins</td><td>2022-10-22</td><td>Saturday </td><td>10</td><td>22</td><td>2022</td><td>13:17:13</td><td>13</td><td>Fall</td><td>Afternoon</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 4410143 × 16\n",
       "\\begin{tabular}{llllllllllllllll}\n",
       " rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & end\\_station\\_name & member\\_casual & ride\\_length & date & day\\_of\\_week & month & day & year & time & hour & season & time\\_of\\_day\\\\\n",
       " <chr> & <dttm> & <dttm> & <chr> & <chr> & <chr> & <drtn> & <date> & <chr> & <chr> & <chr> & <chr> & <time> & <int> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t classic\\_bike  & 2021-11-26 10:27:28 & 2021-11-26 11:22:13 & Michigan Ave \\& Oak St       & Michigan Ave \\& Oak St       & casual &  54.7500000 mins & 2021-11-26 & Friday    & 11 & 26 & 2021 & 10:27:28 & 10 & Fall & Morning  \\\\\n",
       "\t classic\\_bike  & 2021-11-15 09:35:03 & 2021-11-15 09:42:08 & Clark St \\& Grace St         & Clark St \\& Leland Ave       & casual &   7.0833333 mins & 2021-11-15 & Monday    & 11 & 15 & 2021 & 09:35:03 &  9 & Fall & Morning  \\\\\n",
       "\t electric\\_bike & 2021-11-10 16:27:02 & 2021-11-10 17:04:28 & Leamington Ave \\& Hirsch St  & Leamington Ave \\& Hirsch St  & casual &  37.4333333 mins & 2021-11-10 & Wednesday & 11 & 10 & 2021 & 16:27:02 & 16 & Fall & Afternoon\\\\\n",
       "\t classic\\_bike  & 2021-11-09 19:51:36 & 2021-11-09 20:11:17 & Desplaines St \\& Kinzie St   & Desplaines St \\& Kinzie St   & casual &  19.6833333 mins & 2021-11-09 & Tuesday   & 11 & 09 & 2021 & 19:51:36 & 19 & Fall & Evening  \\\\\n",
       "\t classic\\_bike  & 2021-11-06 19:14:10 & 2021-11-06 19:33:19 & Larrabee St \\& Armitage Ave  & Michigan Ave \\& Oak St       & casual &  19.1500000 mins & 2021-11-06 & Saturday  & 11 & 06 & 2021 & 19:14:10 & 19 & Fall & Evening  \\\\\n",
       "\t electric\\_bike & 2021-11-18 11:58:24 & 2021-11-18 12:08:35 & Michigan Ave \\& Oak St       & Michigan Ave \\& Oak St       & casual &  10.1833333 mins & 2021-11-18 & Thursday  & 11 & 18 & 2021 & 11:58:24 & 11 & Fall & Morning  \\\\\n",
       "\t electric\\_bike & 2021-11-23 22:14:11 & 2021-11-23 22:44:01 & Sheridan Rd \\& Noyes St (NU) & Sheridan Rd \\& Noyes St (NU) & casual &  29.8333333 mins & 2021-11-23 & Tuesday   & 11 & 23 & 2021 & 22:14:11 & 22 & Fall & Evening  \\\\\n",
       "\t electric\\_bike & 2021-11-05 16:48:10 & 2021-11-05 16:53:18 & Clark St \\& Grace St         & Clark St \\& Leland Ave       & member &   5.1333333 mins & 2021-11-05 & Friday    & 11 & 05 & 2021 & 16:48:10 & 16 & Fall & Afternoon\\\\\n",
       "\t electric\\_bike & 2021-11-18 08:40:38 & 2021-11-18 08:48:56 & Desplaines St \\& Kinzie St   & Dearborn St \\& Monroe St     & member &   8.3000000 mins & 2021-11-18 & Thursday  & 11 & 18 & 2021 & 08:40:38 &  8 & Fall & Morning  \\\\\n",
       "\t electric\\_bike & 2021-11-14 20:29:33 & 2021-11-14 20:33:13 & Kingsbury St \\& Kinzie St    & Desplaines St \\& Kinzie St   & member &   3.6666667 mins & 2021-11-14 & Sunday    & 11 & 14 & 2021 & 20:29:33 & 20 & Fall & Evening  \\\\\n",
       "\t classic\\_bike  & 2021-11-14 18:36:11 & 2021-11-14 18:38:56 & Desplaines St \\& Kinzie St   & Kingsbury St \\& Kinzie St    & member &   2.7500000 mins & 2021-11-14 & Sunday    & 11 & 14 & 2021 & 18:36:11 & 18 & Fall & Evening  \\\\\n",
       "\t classic\\_bike  & 2021-11-28 15:29:12 & 2021-11-28 15:29:46 & Kingsbury St \\& Kinzie St    & Kingsbury St \\& Kinzie St    & member &   0.5666667 mins & 2021-11-28 & Sunday    & 11 & 28 & 2021 & 15:29:12 & 15 & Fall & Afternoon\\\\\n",
       "\t classic\\_bike  & 2021-11-09 08:25:59 & 2021-11-09 08:33:49 & Kingsbury St \\& Kinzie St    & Dearborn St \\& Monroe St     & member &   7.8333333 mins & 2021-11-09 & Tuesday   & 11 & 09 & 2021 & 08:25:59 &  8 & Fall & Morning  \\\\\n",
       "\t classic\\_bike  & 2021-11-01 14:19:54 & 2021-11-01 14:30:38 & Dearborn St \\& Monroe St     & Dearborn St \\& Monroe St     & member &  10.7333333 mins & 2021-11-01 & Monday    & 11 & 01 & 2021 & 14:19:54 & 14 & Fall & Afternoon\\\\\n",
       "\t docked\\_bike   & 2021-11-07 14:39:41 & 2021-11-07 16:51:20 & Michigan Ave \\& Oak St       & Michigan Ave \\& Oak St       & casual & 131.6500000 mins & 2021-11-07 & Sunday    & 11 & 07 & 2021 & 14:39:41 & 14 & Fall & Afternoon\\\\\n",
       "\t electric\\_bike & 2021-11-08 14:46:14 & 2021-11-08 14:51:45 & Clark St \\& Grace St         & Clark St \\& Leland Ave       & member &   5.5166667 mins & 2021-11-08 & Monday    & 11 & 08 & 2021 & 14:46:14 & 14 & Fall & Afternoon\\\\\n",
       "\t classic\\_bike  & 2021-11-08 13:51:35 & 2021-11-08 13:57:13 & Kingsbury St \\& Kinzie St    & Kingsbury St \\& Kinzie St    & member &   5.6333333 mins & 2021-11-08 & Monday    & 11 & 08 & 2021 & 13:51:35 & 13 & Fall & Afternoon\\\\\n",
       "\t classic\\_bike  & 2021-11-05 16:14:05 & 2021-11-05 16:24:45 & Dearborn St \\& Monroe St     & Kingsbury St \\& Kinzie St    & member &  10.6666667 mins & 2021-11-05 & Friday    & 11 & 05 & 2021 & 16:14:05 & 16 & Fall & Afternoon\\\\\n",
       "\t classic\\_bike  & 2021-11-11 17:54:18 & 2021-11-11 17:57:40 & Desplaines St \\& Kinzie St   & Kingsbury St \\& Kinzie St    & member &   3.3666667 mins & 2021-11-11 & Thursday  & 11 & 11 & 2021 & 17:54:18 & 17 & Fall & Afternoon\\\\\n",
       "\t classic\\_bike  & 2021-11-13 19:41:36 & 2021-11-13 19:44:39 & Kingsbury St \\& Kinzie St    & Desplaines St \\& Kinzie St   & member &   3.0500000 mins & 2021-11-13 & Saturday  & 11 & 13 & 2021 & 19:41:36 & 19 & Fall & Evening  \\\\\n",
       "\t classic\\_bike  & 2021-11-05 17:33:40 & 2021-11-05 17:37:34 & Desplaines St \\& Kinzie St   & Kingsbury St \\& Kinzie St    & member &   3.9000000 mins & 2021-11-05 & Friday    & 11 & 05 & 2021 & 17:33:40 & 17 & Fall & Afternoon\\\\\n",
       "\t classic\\_bike  & 2021-11-04 07:30:25 & 2021-11-04 07:33:24 & Kingsbury St \\& Kinzie St    & Desplaines St \\& Kinzie St   & member &   2.9833333 mins & 2021-11-04 & Thursday  & 11 & 04 & 2021 & 07:30:25 &  7 & Fall & Morning  \\\\\n",
       "\t classic\\_bike  & 2021-11-11 10:56:12 & 2021-11-11 10:59:07 & Kingsbury St \\& Kinzie St    & Desplaines St \\& Kinzie St   & member &   2.9166667 mins & 2021-11-11 & Thursday  & 11 & 11 & 2021 & 10:56:12 & 10 & Fall & Morning  \\\\\n",
       "\t classic\\_bike  & 2021-11-04 18:00:47 & 2021-11-04 18:23:35 & Dearborn St \\& Monroe St     & Larrabee St \\& Armitage Ave  & member &  22.8000000 mins & 2021-11-04 & Thursday  & 11 & 04 & 2021 & 18:00:47 & 18 & Fall & Evening  \\\\\n",
       "\t classic\\_bike  & 2021-11-15 20:04:24 & 2021-11-15 20:06:44 & Kingsbury St \\& Kinzie St    & Desplaines St \\& Kinzie St   & member &   2.3333333 mins & 2021-11-15 & Monday    & 11 & 15 & 2021 & 20:04:24 & 20 & Fall & Evening  \\\\\n",
       "\t electric\\_bike & 2021-11-01 15:49:36 & 2021-11-01 15:50:42 & Kingsbury St \\& Kinzie St    & Kingsbury St \\& Kinzie St    & member &   1.1000000 mins & 2021-11-01 & Monday    & 11 & 01 & 2021 & 15:49:36 & 15 & Fall & Afternoon\\\\\n",
       "\t classic\\_bike  & 2021-11-16 19:01:36 & 2021-11-16 19:04:39 & Desplaines St \\& Kinzie St   & Kingsbury St \\& Kinzie St    & member &   3.0500000 mins & 2021-11-16 & Tuesday   & 11 & 16 & 2021 & 19:01:36 & 19 & Fall & Evening  \\\\\n",
       "\t classic\\_bike  & 2021-11-15 18:53:47 & 2021-11-15 18:56:59 & Desplaines St \\& Kinzie St   & Kingsbury St \\& Kinzie St    & member &   3.2000000 mins & 2021-11-15 & Monday    & 11 & 15 & 2021 & 18:53:47 & 18 & Fall & Evening  \\\\\n",
       "\t classic\\_bike  & 2021-11-15 20:51:53 & 2021-11-15 20:55:04 & Kingsbury St \\& Kinzie St    & Desplaines St \\& Kinzie St   & member &   3.1833333 mins & 2021-11-15 & Monday    & 11 & 15 & 2021 & 20:51:53 & 20 & Fall & Evening  \\\\\n",
       "\t electric\\_bike & 2021-11-28 14:18:18 & 2021-11-28 14:19:24 & Kingsbury St \\& Kinzie St    & Kingsbury St \\& Kinzie St    & member &   1.1000000 mins & 2021-11-28 & Sunday    & 11 & 28 & 2021 & 14:18:18 & 14 & Fall & Afternoon\\\\\n",
       "\t ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮\\\\\n",
       "\t classic\\_bike  & 2022-10-15 14:25:55 & 2022-10-15 14:43:59 & Clark St \\& Wellington Ave       & Damen Ave \\& Clybourn Ave    & member & 18.066667 mins & 2022-10-15 & Saturday  & 10 & 15 & 2022 & 14:25:55 & 14 & Fall & Afternoon\\\\\n",
       "\t classic\\_bike  & 2022-10-22 11:45:36 & 2022-10-22 12:08:05 & Clark St \\& Armitage Ave         & Wabash Ave \\& Grand Ave      & casual & 22.483333 mins & 2022-10-22 & Saturday  & 10 & 22 & 2022 & 11:45:36 & 11 & Fall & Morning  \\\\\n",
       "\t electric\\_bike & 2022-10-09 08:46:51 & 2022-10-09 09:23:25 & Clark St \\& Armitage Ave         & Wabash Ave \\& Grand Ave      & casual & 36.566667 mins & 2022-10-09 & Sunday    & 10 & 09 & 2022 & 08:46:51 &  8 & Fall & Morning  \\\\\n",
       "\t classic\\_bike  & 2022-10-29 10:32:34 & 2022-10-29 11:26:06 & Rush St \\& Hubbard St            & Wabash Ave \\& Grand Ave      & casual & 53.533333 mins & 2022-10-29 & Saturday  & 10 & 29 & 2022 & 10:32:34 & 10 & Fall & Morning  \\\\\n",
       "\t classic\\_bike  & 2022-10-19 15:07:34 & 2022-10-19 15:32:58 & Clark St \\& Wellington Ave       & Wabash Ave \\& Grand Ave      & member & 25.400000 mins & 2022-10-19 & Wednesday & 10 & 19 & 2022 & 15:07:34 & 15 & Fall & Afternoon\\\\\n",
       "\t classic\\_bike  & 2022-10-30 11:41:59 & 2022-10-30 12:00:21 & Clark St \\& Armitage Ave         & Damen Ave \\& Clybourn Ave    & member & 18.366667 mins & 2022-10-30 & Sunday    & 10 & 30 & 2022 & 11:41:59 & 11 & Fall & Morning  \\\\\n",
       "\t classic\\_bike  & 2022-10-18 21:56:49 & 2022-10-18 21:57:40 & Clark St \\& Wellington Ave       & Lincoln Ave \\& Roscoe St*    & member &  0.850000 mins & 2022-10-18 & Tuesday   & 10 & 18 & 2022 & 21:56:49 & 21 & Fall & Evening  \\\\\n",
       "\t electric\\_bike & 2022-10-05 13:18:15 & 2022-10-05 13:23:19 & Clark St \\& Jarvis Ave           & Clark St \\& Schreiber Ave    & member &  5.066667 mins & 2022-10-05 & Wednesday & 10 & 05 & 2022 & 13:18:15 & 13 & Fall & Afternoon\\\\\n",
       "\t classic\\_bike  & 2022-10-18 14:30:58 & 2022-10-18 14:45:43 & Clark St \\& Armitage Ave         & Wabash Ave \\& Grand Ave      & member & 14.750000 mins & 2022-10-18 & Tuesday   & 10 & 18 & 2022 & 14:30:58 & 14 & Fall & Afternoon\\\\\n",
       "\t electric\\_bike & 2022-10-28 13:22:41 & 2022-10-28 13:31:31 & Clark St \\& Armitage Ave         & Wabash Ave \\& Grand Ave      & member &  8.833333 mins & 2022-10-28 & Friday    & 10 & 28 & 2022 & 13:22:41 & 13 & Fall & Afternoon\\\\\n",
       "\t electric\\_bike & 2022-10-30 16:35:18 & 2022-10-30 16:43:49 & Aberdeen St \\& Jackson Blvd      & Desplaines St \\& Randolph St & casual &  8.516667 mins & 2022-10-30 & Sunday    & 10 & 30 & 2022 & 16:35:18 & 16 & Fall & Afternoon\\\\\n",
       "\t classic\\_bike  & 2022-10-30 23:16:31 & 2022-10-30 23:27:09 & Halsted St \\& Roscoe St          & Lincoln Ave \\& Roscoe St*    & casual & 10.633333 mins & 2022-10-30 & Sunday    & 10 & 30 & 2022 & 23:16:31 & 23 & Fall & Evening  \\\\\n",
       "\t classic\\_bike  & 2022-10-21 08:50:25 & 2022-10-21 09:13:02 & Sheridan Rd \\& Montrose Ave      & Clark St \\& Schreiber Ave    & member & 22.616667 mins & 2022-10-21 & Friday    & 10 & 21 & 2022 & 08:50:25 &  8 & Fall & Morning  \\\\\n",
       "\t classic\\_bike  & 2022-10-10 17:00:33 & 2022-10-10 17:08:31 & Aberdeen St \\& Jackson Blvd      & Desplaines St \\& Randolph St & member &  7.966667 mins & 2022-10-10 & Monday    & 10 & 10 & 2022 & 17:00:33 & 17 & Fall & Afternoon\\\\\n",
       "\t docked\\_bike   & 2022-10-22 13:16:48 & 2022-10-22 13:46:04 & Clark St \\& Armitage Ave         & Wabash Ave \\& Grand Ave      & casual & 29.266667 mins & 2022-10-22 & Saturday  & 10 & 22 & 2022 & 13:16:48 & 13 & Fall & Afternoon\\\\\n",
       "\t classic\\_bike  & 2022-10-20 18:21:05 & 2022-10-20 18:39:29 & Clark St \\& Armitage Ave         & Wabash Ave \\& Grand Ave      & member & 18.400000 mins & 2022-10-20 & Thursday  & 10 & 20 & 2022 & 18:21:05 & 18 & Fall & Evening  \\\\\n",
       "\t classic\\_bike  & 2022-10-07 17:01:45 & 2022-10-07 17:07:44 & Aberdeen St \\& Jackson Blvd      & Desplaines St \\& Randolph St & member &  5.983333 mins & 2022-10-07 & Friday    & 10 & 07 & 2022 & 17:01:45 & 17 & Fall & Afternoon\\\\\n",
       "\t classic\\_bike  & 2022-10-28 16:22:14 & 2022-10-28 16:37:37 & Halsted St \\& Roscoe St          & Damen Ave \\& Clybourn Ave    & member & 15.383333 mins & 2022-10-28 & Friday    & 10 & 28 & 2022 & 16:22:14 & 16 & Fall & Afternoon\\\\\n",
       "\t electric\\_bike & 2022-10-01 21:57:14 & 2022-10-01 22:27:49 & Halsted St \\& Roscoe St          & Wabash Ave \\& Grand Ave      & casual & 30.583333 mins & 2022-10-01 & Saturday  & 10 & 01 & 2022 & 21:57:14 & 21 & Fall & Evening  \\\\\n",
       "\t classic\\_bike  & 2022-10-28 10:54:37 & 2022-10-28 11:01:53 & Blackstone Ave \\& Hyde Park Blvd & Lake Park Ave \\& 47th St     & member &  7.266667 mins & 2022-10-28 & Friday    & 10 & 28 & 2022 & 10:54:37 & 10 & Fall & Morning  \\\\\n",
       "\t classic\\_bike  & 2022-10-22 18:32:35 & 2022-10-22 18:45:49 & Rush St \\& Hubbard St            & Desplaines St \\& Randolph St & casual & 13.233333 mins & 2022-10-22 & Saturday  & 10 & 22 & 2022 & 18:32:35 & 18 & Fall & Evening  \\\\\n",
       "\t classic\\_bike  & 2022-10-19 07:27:19 & 2022-10-19 07:40:26 & Rush St \\& Hubbard St            & Desplaines St \\& Randolph St & casual & 13.116667 mins & 2022-10-19 & Wednesday & 10 & 19 & 2022 & 07:27:19 &  7 & Fall & Morning  \\\\\n",
       "\t docked\\_bike   & 2022-10-22 13:17:09 & 2022-10-22 13:46:18 & Clark St \\& Armitage Ave         & Wabash Ave \\& Grand Ave      & casual & 29.150000 mins & 2022-10-22 & Saturday  & 10 & 22 & 2022 & 13:17:09 & 13 & Fall & Afternoon\\\\\n",
       "\t electric\\_bike & 2022-10-16 14:50:27 & 2022-10-16 14:53:11 & Blackstone Ave \\& Hyde Park Blvd & Lake Park Ave \\& 47th St     & member &  2.733333 mins & 2022-10-16 & Sunday    & 10 & 16 & 2022 & 14:50:27 & 14 & Fall & Afternoon\\\\\n",
       "\t classic\\_bike  & 2022-10-24 17:45:38 & 2022-10-24 17:48:02 & Sedgwick St \\& North Ave         & Lincoln Ave \\& Roscoe St*    & member &  2.400000 mins & 2022-10-24 & Monday    & 10 & 24 & 2022 & 17:45:38 & 17 & Fall & Afternoon\\\\\n",
       "\t classic\\_bike  & 2022-10-30 01:41:29 & 2022-10-30 01:57:16 & Clifton Ave \\& Armitage Ave      & Lincoln Ave \\& Roscoe St*    & casual & 15.783333 mins & 2022-10-30 & Sunday    & 10 & 30 & 2022 & 01:41:29 &  1 & Fall & Night    \\\\\n",
       "\t classic\\_bike  & 2022-10-30 01:41:54 & 2022-10-30 01:57:09 & Clifton Ave \\& Armitage Ave      & Lincoln Ave \\& Roscoe St*    & casual & 15.250000 mins & 2022-10-30 & Sunday    & 10 & 30 & 2022 & 01:41:54 &  1 & Fall & Night    \\\\\n",
       "\t classic\\_bike  & 2022-10-15 09:34:11 & 2022-10-15 10:03:21 & Sedgwick St \\& North Ave         & Wabash Ave \\& Grand Ave      & casual & 29.166667 mins & 2022-10-15 & Saturday  & 10 & 15 & 2022 & 09:34:11 &  9 & Fall & Morning  \\\\\n",
       "\t classic\\_bike  & 2022-10-09 10:21:34 & 2022-10-09 10:43:45 & Sedgwick St \\& North Ave         & Damen Ave \\& Clybourn Ave    & member & 22.183333 mins & 2022-10-09 & Sunday    & 10 & 09 & 2022 & 10:21:34 & 10 & Fall & Morning  \\\\\n",
       "\t docked\\_bike   & 2022-10-22 13:17:13 & 2022-10-22 13:46:14 & Clark St \\& Armitage Ave         & Wabash Ave \\& Grand Ave      & casual & 29.016667 mins & 2022-10-22 & Saturday  & 10 & 22 & 2022 & 13:17:13 & 13 & Fall & Afternoon\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 4410143 × 16\n",
       "\n",
       "| rideable_type &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | start_station_name &lt;chr&gt; | end_station_name &lt;chr&gt; | member_casual &lt;chr&gt; | ride_length &lt;drtn&gt; | date &lt;date&gt; | day_of_week &lt;chr&gt; | month &lt;chr&gt; | day &lt;chr&gt; | year &lt;chr&gt; | time &lt;time&gt; | hour &lt;int&gt; | season &lt;chr&gt; | time_of_day &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| classic_bike  | 2021-11-26 10:27:28 | 2021-11-26 11:22:13 | Michigan Ave &amp; Oak St       | Michigan Ave &amp; Oak St       | casual |  54.7500000 mins | 2021-11-26 | Friday    | 11 | 26 | 2021 | 10:27:28 | 10 | Fall | Morning   |\n",
       "| classic_bike  | 2021-11-15 09:35:03 | 2021-11-15 09:42:08 | Clark St &amp; Grace St         | Clark St &amp; Leland Ave       | casual |   7.0833333 mins | 2021-11-15 | Monday    | 11 | 15 | 2021 | 09:35:03 |  9 | Fall | Morning   |\n",
       "| electric_bike | 2021-11-10 16:27:02 | 2021-11-10 17:04:28 | Leamington Ave &amp; Hirsch St  | Leamington Ave &amp; Hirsch St  | casual |  37.4333333 mins | 2021-11-10 | Wednesday | 11 | 10 | 2021 | 16:27:02 | 16 | Fall | Afternoon |\n",
       "| classic_bike  | 2021-11-09 19:51:36 | 2021-11-09 20:11:17 | Desplaines St &amp; Kinzie St   | Desplaines St &amp; Kinzie St   | casual |  19.6833333 mins | 2021-11-09 | Tuesday   | 11 | 09 | 2021 | 19:51:36 | 19 | Fall | Evening   |\n",
       "| classic_bike  | 2021-11-06 19:14:10 | 2021-11-06 19:33:19 | Larrabee St &amp; Armitage Ave  | Michigan Ave &amp; Oak St       | casual |  19.1500000 mins | 2021-11-06 | Saturday  | 11 | 06 | 2021 | 19:14:10 | 19 | Fall | Evening   |\n",
       "| electric_bike | 2021-11-18 11:58:24 | 2021-11-18 12:08:35 | Michigan Ave &amp; Oak St       | Michigan Ave &amp; Oak St       | casual |  10.1833333 mins | 2021-11-18 | Thursday  | 11 | 18 | 2021 | 11:58:24 | 11 | Fall | Morning   |\n",
       "| electric_bike | 2021-11-23 22:14:11 | 2021-11-23 22:44:01 | Sheridan Rd &amp; Noyes St (NU) | Sheridan Rd &amp; Noyes St (NU) | casual |  29.8333333 mins | 2021-11-23 | Tuesday   | 11 | 23 | 2021 | 22:14:11 | 22 | Fall | Evening   |\n",
       "| electric_bike | 2021-11-05 16:48:10 | 2021-11-05 16:53:18 | Clark St &amp; Grace St         | Clark St &amp; Leland Ave       | member |   5.1333333 mins | 2021-11-05 | Friday    | 11 | 05 | 2021 | 16:48:10 | 16 | Fall | Afternoon |\n",
       "| electric_bike | 2021-11-18 08:40:38 | 2021-11-18 08:48:56 | Desplaines St &amp; Kinzie St   | Dearborn St &amp; Monroe St     | member |   8.3000000 mins | 2021-11-18 | Thursday  | 11 | 18 | 2021 | 08:40:38 |  8 | Fall | Morning   |\n",
       "| electric_bike | 2021-11-14 20:29:33 | 2021-11-14 20:33:13 | Kingsbury St &amp; Kinzie St    | Desplaines St &amp; Kinzie St   | member |   3.6666667 mins | 2021-11-14 | Sunday    | 11 | 14 | 2021 | 20:29:33 | 20 | Fall | Evening   |\n",
       "| classic_bike  | 2021-11-14 18:36:11 | 2021-11-14 18:38:56 | Desplaines St &amp; Kinzie St   | Kingsbury St &amp; Kinzie St    | member |   2.7500000 mins | 2021-11-14 | Sunday    | 11 | 14 | 2021 | 18:36:11 | 18 | Fall | Evening   |\n",
       "| classic_bike  | 2021-11-28 15:29:12 | 2021-11-28 15:29:46 | Kingsbury St &amp; Kinzie St    | Kingsbury St &amp; Kinzie St    | member |   0.5666667 mins | 2021-11-28 | Sunday    | 11 | 28 | 2021 | 15:29:12 | 15 | Fall | Afternoon |\n",
       "| classic_bike  | 2021-11-09 08:25:59 | 2021-11-09 08:33:49 | Kingsbury St &amp; Kinzie St    | Dearborn St &amp; Monroe St     | member |   7.8333333 mins | 2021-11-09 | Tuesday   | 11 | 09 | 2021 | 08:25:59 |  8 | Fall | Morning   |\n",
       "| classic_bike  | 2021-11-01 14:19:54 | 2021-11-01 14:30:38 | Dearborn St &amp; Monroe St     | Dearborn St &amp; Monroe St     | member |  10.7333333 mins | 2021-11-01 | Monday    | 11 | 01 | 2021 | 14:19:54 | 14 | Fall | Afternoon |\n",
       "| docked_bike   | 2021-11-07 14:39:41 | 2021-11-07 16:51:20 | Michigan Ave &amp; Oak St       | Michigan Ave &amp; Oak St       | casual | 131.6500000 mins | 2021-11-07 | Sunday    | 11 | 07 | 2021 | 14:39:41 | 14 | Fall | Afternoon |\n",
       "| electric_bike | 2021-11-08 14:46:14 | 2021-11-08 14:51:45 | Clark St &amp; Grace St         | Clark St &amp; Leland Ave       | member |   5.5166667 mins | 2021-11-08 | Monday    | 11 | 08 | 2021 | 14:46:14 | 14 | Fall | Afternoon |\n",
       "| classic_bike  | 2021-11-08 13:51:35 | 2021-11-08 13:57:13 | Kingsbury St &amp; Kinzie St    | Kingsbury St &amp; Kinzie St    | member |   5.6333333 mins | 2021-11-08 | Monday    | 11 | 08 | 2021 | 13:51:35 | 13 | Fall | Afternoon |\n",
       "| classic_bike  | 2021-11-05 16:14:05 | 2021-11-05 16:24:45 | Dearborn St &amp; Monroe St     | Kingsbury St &amp; Kinzie St    | member |  10.6666667 mins | 2021-11-05 | Friday    | 11 | 05 | 2021 | 16:14:05 | 16 | Fall | Afternoon |\n",
       "| classic_bike  | 2021-11-11 17:54:18 | 2021-11-11 17:57:40 | Desplaines St &amp; Kinzie St   | Kingsbury St &amp; Kinzie St    | member |   3.3666667 mins | 2021-11-11 | Thursday  | 11 | 11 | 2021 | 17:54:18 | 17 | Fall | Afternoon |\n",
       "| classic_bike  | 2021-11-13 19:41:36 | 2021-11-13 19:44:39 | Kingsbury St &amp; Kinzie St    | Desplaines St &amp; Kinzie St   | member |   3.0500000 mins | 2021-11-13 | Saturday  | 11 | 13 | 2021 | 19:41:36 | 19 | Fall | Evening   |\n",
       "| classic_bike  | 2021-11-05 17:33:40 | 2021-11-05 17:37:34 | Desplaines St &amp; Kinzie St   | Kingsbury St &amp; Kinzie St    | member |   3.9000000 mins | 2021-11-05 | Friday    | 11 | 05 | 2021 | 17:33:40 | 17 | Fall | Afternoon |\n",
       "| classic_bike  | 2021-11-04 07:30:25 | 2021-11-04 07:33:24 | Kingsbury St &amp; Kinzie St    | Desplaines St &amp; Kinzie St   | member |   2.9833333 mins | 2021-11-04 | Thursday  | 11 | 04 | 2021 | 07:30:25 |  7 | Fall | Morning   |\n",
       "| classic_bike  | 2021-11-11 10:56:12 | 2021-11-11 10:59:07 | Kingsbury St &amp; Kinzie St    | Desplaines St &amp; Kinzie St   | member |   2.9166667 mins | 2021-11-11 | Thursday  | 11 | 11 | 2021 | 10:56:12 | 10 | Fall | Morning   |\n",
       "| classic_bike  | 2021-11-04 18:00:47 | 2021-11-04 18:23:35 | Dearborn St &amp; Monroe St     | Larrabee St &amp; Armitage Ave  | member |  22.8000000 mins | 2021-11-04 | Thursday  | 11 | 04 | 2021 | 18:00:47 | 18 | Fall | Evening   |\n",
       "| classic_bike  | 2021-11-15 20:04:24 | 2021-11-15 20:06:44 | Kingsbury St &amp; Kinzie St    | Desplaines St &amp; Kinzie St   | member |   2.3333333 mins | 2021-11-15 | Monday    | 11 | 15 | 2021 | 20:04:24 | 20 | Fall | Evening   |\n",
       "| electric_bike | 2021-11-01 15:49:36 | 2021-11-01 15:50:42 | Kingsbury St &amp; Kinzie St    | Kingsbury St &amp; Kinzie St    | member |   1.1000000 mins | 2021-11-01 | Monday    | 11 | 01 | 2021 | 15:49:36 | 15 | Fall | Afternoon |\n",
       "| classic_bike  | 2021-11-16 19:01:36 | 2021-11-16 19:04:39 | Desplaines St &amp; Kinzie St   | Kingsbury St &amp; Kinzie St    | member |   3.0500000 mins | 2021-11-16 | Tuesday   | 11 | 16 | 2021 | 19:01:36 | 19 | Fall | Evening   |\n",
       "| classic_bike  | 2021-11-15 18:53:47 | 2021-11-15 18:56:59 | Desplaines St &amp; Kinzie St   | Kingsbury St &amp; Kinzie St    | member |   3.2000000 mins | 2021-11-15 | Monday    | 11 | 15 | 2021 | 18:53:47 | 18 | Fall | Evening   |\n",
       "| classic_bike  | 2021-11-15 20:51:53 | 2021-11-15 20:55:04 | Kingsbury St &amp; Kinzie St    | Desplaines St &amp; Kinzie St   | member |   3.1833333 mins | 2021-11-15 | Monday    | 11 | 15 | 2021 | 20:51:53 | 20 | Fall | Evening   |\n",
       "| electric_bike | 2021-11-28 14:18:18 | 2021-11-28 14:19:24 | Kingsbury St &amp; Kinzie St    | Kingsbury St &amp; Kinzie St    | member |   1.1000000 mins | 2021-11-28 | Sunday    | 11 | 28 | 2021 | 14:18:18 | 14 | Fall | Afternoon |\n",
       "| ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ |\n",
       "| classic_bike  | 2022-10-15 14:25:55 | 2022-10-15 14:43:59 | Clark St &amp; Wellington Ave       | Damen Ave &amp; Clybourn Ave    | member | 18.066667 mins | 2022-10-15 | Saturday  | 10 | 15 | 2022 | 14:25:55 | 14 | Fall | Afternoon |\n",
       "| classic_bike  | 2022-10-22 11:45:36 | 2022-10-22 12:08:05 | Clark St &amp; Armitage Ave         | Wabash Ave &amp; Grand Ave      | casual | 22.483333 mins | 2022-10-22 | Saturday  | 10 | 22 | 2022 | 11:45:36 | 11 | Fall | Morning   |\n",
       "| electric_bike | 2022-10-09 08:46:51 | 2022-10-09 09:23:25 | Clark St &amp; Armitage Ave         | Wabash Ave &amp; Grand Ave      | casual | 36.566667 mins | 2022-10-09 | Sunday    | 10 | 09 | 2022 | 08:46:51 |  8 | Fall | Morning   |\n",
       "| classic_bike  | 2022-10-29 10:32:34 | 2022-10-29 11:26:06 | Rush St &amp; Hubbard St            | Wabash Ave &amp; Grand Ave      | casual | 53.533333 mins | 2022-10-29 | Saturday  | 10 | 29 | 2022 | 10:32:34 | 10 | Fall | Morning   |\n",
       "| classic_bike  | 2022-10-19 15:07:34 | 2022-10-19 15:32:58 | Clark St &amp; Wellington Ave       | Wabash Ave &amp; Grand Ave      | member | 25.400000 mins | 2022-10-19 | Wednesday | 10 | 19 | 2022 | 15:07:34 | 15 | Fall | Afternoon |\n",
       "| classic_bike  | 2022-10-30 11:41:59 | 2022-10-30 12:00:21 | Clark St &amp; Armitage Ave         | Damen Ave &amp; Clybourn Ave    | member | 18.366667 mins | 2022-10-30 | Sunday    | 10 | 30 | 2022 | 11:41:59 | 11 | Fall | Morning   |\n",
       "| classic_bike  | 2022-10-18 21:56:49 | 2022-10-18 21:57:40 | Clark St &amp; Wellington Ave       | Lincoln Ave &amp; Roscoe St*    | member |  0.850000 mins | 2022-10-18 | Tuesday   | 10 | 18 | 2022 | 21:56:49 | 21 | Fall | Evening   |\n",
       "| electric_bike | 2022-10-05 13:18:15 | 2022-10-05 13:23:19 | Clark St &amp; Jarvis Ave           | Clark St &amp; Schreiber Ave    | member |  5.066667 mins | 2022-10-05 | Wednesday | 10 | 05 | 2022 | 13:18:15 | 13 | Fall | Afternoon |\n",
       "| classic_bike  | 2022-10-18 14:30:58 | 2022-10-18 14:45:43 | Clark St &amp; Armitage Ave         | Wabash Ave &amp; Grand Ave      | member | 14.750000 mins | 2022-10-18 | Tuesday   | 10 | 18 | 2022 | 14:30:58 | 14 | Fall | Afternoon |\n",
       "| electric_bike | 2022-10-28 13:22:41 | 2022-10-28 13:31:31 | Clark St &amp; Armitage Ave         | Wabash Ave &amp; Grand Ave      | member |  8.833333 mins | 2022-10-28 | Friday    | 10 | 28 | 2022 | 13:22:41 | 13 | Fall | Afternoon |\n",
       "| electric_bike | 2022-10-30 16:35:18 | 2022-10-30 16:43:49 | Aberdeen St &amp; Jackson Blvd      | Desplaines St &amp; Randolph St | casual |  8.516667 mins | 2022-10-30 | Sunday    | 10 | 30 | 2022 | 16:35:18 | 16 | Fall | Afternoon |\n",
       "| classic_bike  | 2022-10-30 23:16:31 | 2022-10-30 23:27:09 | Halsted St &amp; Roscoe St          | Lincoln Ave &amp; Roscoe St*    | casual | 10.633333 mins | 2022-10-30 | Sunday    | 10 | 30 | 2022 | 23:16:31 | 23 | Fall | Evening   |\n",
       "| classic_bike  | 2022-10-21 08:50:25 | 2022-10-21 09:13:02 | Sheridan Rd &amp; Montrose Ave      | Clark St &amp; Schreiber Ave    | member | 22.616667 mins | 2022-10-21 | Friday    | 10 | 21 | 2022 | 08:50:25 |  8 | Fall | Morning   |\n",
       "| classic_bike  | 2022-10-10 17:00:33 | 2022-10-10 17:08:31 | Aberdeen St &amp; Jackson Blvd      | Desplaines St &amp; Randolph St | member |  7.966667 mins | 2022-10-10 | Monday    | 10 | 10 | 2022 | 17:00:33 | 17 | Fall | Afternoon |\n",
       "| docked_bike   | 2022-10-22 13:16:48 | 2022-10-22 13:46:04 | Clark St &amp; Armitage Ave         | Wabash Ave &amp; Grand Ave      | casual | 29.266667 mins | 2022-10-22 | Saturday  | 10 | 22 | 2022 | 13:16:48 | 13 | Fall | Afternoon |\n",
       "| classic_bike  | 2022-10-20 18:21:05 | 2022-10-20 18:39:29 | Clark St &amp; Armitage Ave         | Wabash Ave &amp; Grand Ave      | member | 18.400000 mins | 2022-10-20 | Thursday  | 10 | 20 | 2022 | 18:21:05 | 18 | Fall | Evening   |\n",
       "| classic_bike  | 2022-10-07 17:01:45 | 2022-10-07 17:07:44 | Aberdeen St &amp; Jackson Blvd      | Desplaines St &amp; Randolph St | member |  5.983333 mins | 2022-10-07 | Friday    | 10 | 07 | 2022 | 17:01:45 | 17 | Fall | Afternoon |\n",
       "| classic_bike  | 2022-10-28 16:22:14 | 2022-10-28 16:37:37 | Halsted St &amp; Roscoe St          | Damen Ave &amp; Clybourn Ave    | member | 15.383333 mins | 2022-10-28 | Friday    | 10 | 28 | 2022 | 16:22:14 | 16 | Fall | Afternoon |\n",
       "| electric_bike | 2022-10-01 21:57:14 | 2022-10-01 22:27:49 | Halsted St &amp; Roscoe St          | Wabash Ave &amp; Grand Ave      | casual | 30.583333 mins | 2022-10-01 | Saturday  | 10 | 01 | 2022 | 21:57:14 | 21 | Fall | Evening   |\n",
       "| classic_bike  | 2022-10-28 10:54:37 | 2022-10-28 11:01:53 | Blackstone Ave &amp; Hyde Park Blvd | Lake Park Ave &amp; 47th St     | member |  7.266667 mins | 2022-10-28 | Friday    | 10 | 28 | 2022 | 10:54:37 | 10 | Fall | Morning   |\n",
       "| classic_bike  | 2022-10-22 18:32:35 | 2022-10-22 18:45:49 | Rush St &amp; Hubbard St            | Desplaines St &amp; Randolph St | casual | 13.233333 mins | 2022-10-22 | Saturday  | 10 | 22 | 2022 | 18:32:35 | 18 | Fall | Evening   |\n",
       "| classic_bike  | 2022-10-19 07:27:19 | 2022-10-19 07:40:26 | Rush St &amp; Hubbard St            | Desplaines St &amp; Randolph St | casual | 13.116667 mins | 2022-10-19 | Wednesday | 10 | 19 | 2022 | 07:27:19 |  7 | Fall | Morning   |\n",
       "| docked_bike   | 2022-10-22 13:17:09 | 2022-10-22 13:46:18 | Clark St &amp; Armitage Ave         | Wabash Ave &amp; Grand Ave      | casual | 29.150000 mins | 2022-10-22 | Saturday  | 10 | 22 | 2022 | 13:17:09 | 13 | Fall | Afternoon |\n",
       "| electric_bike | 2022-10-16 14:50:27 | 2022-10-16 14:53:11 | Blackstone Ave &amp; Hyde Park Blvd | Lake Park Ave &amp; 47th St     | member |  2.733333 mins | 2022-10-16 | Sunday    | 10 | 16 | 2022 | 14:50:27 | 14 | Fall | Afternoon |\n",
       "| classic_bike  | 2022-10-24 17:45:38 | 2022-10-24 17:48:02 | Sedgwick St &amp; North Ave         | Lincoln Ave &amp; Roscoe St*    | member |  2.400000 mins | 2022-10-24 | Monday    | 10 | 24 | 2022 | 17:45:38 | 17 | Fall | Afternoon |\n",
       "| classic_bike  | 2022-10-30 01:41:29 | 2022-10-30 01:57:16 | Clifton Ave &amp; Armitage Ave      | Lincoln Ave &amp; Roscoe St*    | casual | 15.783333 mins | 2022-10-30 | Sunday    | 10 | 30 | 2022 | 01:41:29 |  1 | Fall | Night     |\n",
       "| classic_bike  | 2022-10-30 01:41:54 | 2022-10-30 01:57:09 | Clifton Ave &amp; Armitage Ave      | Lincoln Ave &amp; Roscoe St*    | casual | 15.250000 mins | 2022-10-30 | Sunday    | 10 | 30 | 2022 | 01:41:54 |  1 | Fall | Night     |\n",
       "| classic_bike  | 2022-10-15 09:34:11 | 2022-10-15 10:03:21 | Sedgwick St &amp; North Ave         | Wabash Ave &amp; Grand Ave      | casual | 29.166667 mins | 2022-10-15 | Saturday  | 10 | 15 | 2022 | 09:34:11 |  9 | Fall | Morning   |\n",
       "| classic_bike  | 2022-10-09 10:21:34 | 2022-10-09 10:43:45 | Sedgwick St &amp; North Ave         | Damen Ave &amp; Clybourn Ave    | member | 22.183333 mins | 2022-10-09 | Sunday    | 10 | 09 | 2022 | 10:21:34 | 10 | Fall | Morning   |\n",
       "| docked_bike   | 2022-10-22 13:17:13 | 2022-10-22 13:46:14 | Clark St &amp; Armitage Ave         | Wabash Ave &amp; Grand Ave      | casual | 29.016667 mins | 2022-10-22 | Saturday  | 10 | 22 | 2022 | 13:17:13 | 13 | Fall | Afternoon |\n",
       "\n"
      ],
      "text/plain": [
       "        rideable_type started_at          ended_at           \n",
       "1       classic_bike  2021-11-26 10:27:28 2021-11-26 11:22:13\n",
       "2       classic_bike  2021-11-15 09:35:03 2021-11-15 09:42:08\n",
       "3       electric_bike 2021-11-10 16:27:02 2021-11-10 17:04:28\n",
       "4       classic_bike  2021-11-09 19:51:36 2021-11-09 20:11:17\n",
       "5       classic_bike  2021-11-06 19:14:10 2021-11-06 19:33:19\n",
       "6       electric_bike 2021-11-18 11:58:24 2021-11-18 12:08:35\n",
       "7       electric_bike 2021-11-23 22:14:11 2021-11-23 22:44:01\n",
       "8       electric_bike 2021-11-05 16:48:10 2021-11-05 16:53:18\n",
       "9       electric_bike 2021-11-18 08:40:38 2021-11-18 08:48:56\n",
       "10      electric_bike 2021-11-14 20:29:33 2021-11-14 20:33:13\n",
       "11      classic_bike  2021-11-14 18:36:11 2021-11-14 18:38:56\n",
       "12      classic_bike  2021-11-28 15:29:12 2021-11-28 15:29:46\n",
       "13      classic_bike  2021-11-09 08:25:59 2021-11-09 08:33:49\n",
       "14      classic_bike  2021-11-01 14:19:54 2021-11-01 14:30:38\n",
       "15      docked_bike   2021-11-07 14:39:41 2021-11-07 16:51:20\n",
       "16      electric_bike 2021-11-08 14:46:14 2021-11-08 14:51:45\n",
       "17      classic_bike  2021-11-08 13:51:35 2021-11-08 13:57:13\n",
       "18      classic_bike  2021-11-05 16:14:05 2021-11-05 16:24:45\n",
       "19      classic_bike  2021-11-11 17:54:18 2021-11-11 17:57:40\n",
       "20      classic_bike  2021-11-13 19:41:36 2021-11-13 19:44:39\n",
       "21      classic_bike  2021-11-05 17:33:40 2021-11-05 17:37:34\n",
       "22      classic_bike  2021-11-04 07:30:25 2021-11-04 07:33:24\n",
       "23      classic_bike  2021-11-11 10:56:12 2021-11-11 10:59:07\n",
       "24      classic_bike  2021-11-04 18:00:47 2021-11-04 18:23:35\n",
       "25      classic_bike  2021-11-15 20:04:24 2021-11-15 20:06:44\n",
       "26      electric_bike 2021-11-01 15:49:36 2021-11-01 15:50:42\n",
       "27      classic_bike  2021-11-16 19:01:36 2021-11-16 19:04:39\n",
       "28      classic_bike  2021-11-15 18:53:47 2021-11-15 18:56:59\n",
       "29      classic_bike  2021-11-15 20:51:53 2021-11-15 20:55:04\n",
       "30      electric_bike 2021-11-28 14:18:18 2021-11-28 14:19:24\n",
       "⋮       ⋮             ⋮                   ⋮                  \n",
       "4410114 classic_bike  2022-10-15 14:25:55 2022-10-15 14:43:59\n",
       "4410115 classic_bike  2022-10-22 11:45:36 2022-10-22 12:08:05\n",
       "4410116 electric_bike 2022-10-09 08:46:51 2022-10-09 09:23:25\n",
       "4410117 classic_bike  2022-10-29 10:32:34 2022-10-29 11:26:06\n",
       "4410118 classic_bike  2022-10-19 15:07:34 2022-10-19 15:32:58\n",
       "4410119 classic_bike  2022-10-30 11:41:59 2022-10-30 12:00:21\n",
       "4410120 classic_bike  2022-10-18 21:56:49 2022-10-18 21:57:40\n",
       "4410121 electric_bike 2022-10-05 13:18:15 2022-10-05 13:23:19\n",
       "4410122 classic_bike  2022-10-18 14:30:58 2022-10-18 14:45:43\n",
       "4410123 electric_bike 2022-10-28 13:22:41 2022-10-28 13:31:31\n",
       "4410124 electric_bike 2022-10-30 16:35:18 2022-10-30 16:43:49\n",
       "4410125 classic_bike  2022-10-30 23:16:31 2022-10-30 23:27:09\n",
       "4410126 classic_bike  2022-10-21 08:50:25 2022-10-21 09:13:02\n",
       "4410127 classic_bike  2022-10-10 17:00:33 2022-10-10 17:08:31\n",
       "4410128 docked_bike   2022-10-22 13:16:48 2022-10-22 13:46:04\n",
       "4410129 classic_bike  2022-10-20 18:21:05 2022-10-20 18:39:29\n",
       "4410130 classic_bike  2022-10-07 17:01:45 2022-10-07 17:07:44\n",
       "4410131 classic_bike  2022-10-28 16:22:14 2022-10-28 16:37:37\n",
       "4410132 electric_bike 2022-10-01 21:57:14 2022-10-01 22:27:49\n",
       "4410133 classic_bike  2022-10-28 10:54:37 2022-10-28 11:01:53\n",
       "4410134 classic_bike  2022-10-22 18:32:35 2022-10-22 18:45:49\n",
       "4410135 classic_bike  2022-10-19 07:27:19 2022-10-19 07:40:26\n",
       "4410136 docked_bike   2022-10-22 13:17:09 2022-10-22 13:46:18\n",
       "4410137 electric_bike 2022-10-16 14:50:27 2022-10-16 14:53:11\n",
       "4410138 classic_bike  2022-10-24 17:45:38 2022-10-24 17:48:02\n",
       "4410139 classic_bike  2022-10-30 01:41:29 2022-10-30 01:57:16\n",
       "4410140 classic_bike  2022-10-30 01:41:54 2022-10-30 01:57:09\n",
       "4410141 classic_bike  2022-10-15 09:34:11 2022-10-15 10:03:21\n",
       "4410142 classic_bike  2022-10-09 10:21:34 2022-10-09 10:43:45\n",
       "4410143 docked_bike   2022-10-22 13:17:13 2022-10-22 13:46:14\n",
       "        start_station_name              end_station_name           \n",
       "1       Michigan Ave & Oak St           Michigan Ave & Oak St      \n",
       "2       Clark St & Grace St             Clark St & Leland Ave      \n",
       "3       Leamington Ave & Hirsch St      Leamington Ave & Hirsch St \n",
       "4       Desplaines St & Kinzie St       Desplaines St & Kinzie St  \n",
       "5       Larrabee St & Armitage Ave      Michigan Ave & Oak St      \n",
       "6       Michigan Ave & Oak St           Michigan Ave & Oak St      \n",
       "7       Sheridan Rd & Noyes St (NU)     Sheridan Rd & Noyes St (NU)\n",
       "8       Clark St & Grace St             Clark St & Leland Ave      \n",
       "9       Desplaines St & Kinzie St       Dearborn St & Monroe St    \n",
       "10      Kingsbury St & Kinzie St        Desplaines St & Kinzie St  \n",
       "11      Desplaines St & Kinzie St       Kingsbury St & Kinzie St   \n",
       "12      Kingsbury St & Kinzie St        Kingsbury St & Kinzie St   \n",
       "13      Kingsbury St & Kinzie St        Dearborn St & Monroe St    \n",
       "14      Dearborn St & Monroe St         Dearborn St & Monroe St    \n",
       "15      Michigan Ave & Oak St           Michigan Ave & Oak St      \n",
       "16      Clark St & Grace St             Clark St & Leland Ave      \n",
       "17      Kingsbury St & Kinzie St        Kingsbury St & Kinzie St   \n",
       "18      Dearborn St & Monroe St         Kingsbury St & Kinzie St   \n",
       "19      Desplaines St & Kinzie St       Kingsbury St & Kinzie St   \n",
       "20      Kingsbury St & Kinzie St        Desplaines St & Kinzie St  \n",
       "21      Desplaines St & Kinzie St       Kingsbury St & Kinzie St   \n",
       "22      Kingsbury St & Kinzie St        Desplaines St & Kinzie St  \n",
       "23      Kingsbury St & Kinzie St        Desplaines St & Kinzie St  \n",
       "24      Dearborn St & Monroe St         Larrabee St & Armitage Ave \n",
       "25      Kingsbury St & Kinzie St        Desplaines St & Kinzie St  \n",
       "26      Kingsbury St & Kinzie St        Kingsbury St & Kinzie St   \n",
       "27      Desplaines St & Kinzie St       Kingsbury St & Kinzie St   \n",
       "28      Desplaines St & Kinzie St       Kingsbury St & Kinzie St   \n",
       "29      Kingsbury St & Kinzie St        Desplaines St & Kinzie St  \n",
       "30      Kingsbury St & Kinzie St        Kingsbury St & Kinzie St   \n",
       "⋮       ⋮                               ⋮                          \n",
       "4410114 Clark St & Wellington Ave       Damen Ave & Clybourn Ave   \n",
       "4410115 Clark St & Armitage Ave         Wabash Ave & Grand Ave     \n",
       "4410116 Clark St & Armitage Ave         Wabash Ave & Grand Ave     \n",
       "4410117 Rush St & Hubbard St            Wabash Ave & Grand Ave     \n",
       "4410118 Clark St & Wellington Ave       Wabash Ave & Grand Ave     \n",
       "4410119 Clark St & Armitage Ave         Damen Ave & Clybourn Ave   \n",
       "4410120 Clark St & Wellington Ave       Lincoln Ave & Roscoe St*   \n",
       "4410121 Clark St & Jarvis Ave           Clark St & Schreiber Ave   \n",
       "4410122 Clark St & Armitage Ave         Wabash Ave & Grand Ave     \n",
       "4410123 Clark St & Armitage Ave         Wabash Ave & Grand Ave     \n",
       "4410124 Aberdeen St & Jackson Blvd      Desplaines St & Randolph St\n",
       "4410125 Halsted St & Roscoe St          Lincoln Ave & Roscoe St*   \n",
       "4410126 Sheridan Rd & Montrose Ave      Clark St & Schreiber Ave   \n",
       "4410127 Aberdeen St & Jackson Blvd      Desplaines St & Randolph St\n",
       "4410128 Clark St & Armitage Ave         Wabash Ave & Grand Ave     \n",
       "4410129 Clark St & Armitage Ave         Wabash Ave & Grand Ave     \n",
       "4410130 Aberdeen St & Jackson Blvd      Desplaines St & Randolph St\n",
       "4410131 Halsted St & Roscoe St          Damen Ave & Clybourn Ave   \n",
       "4410132 Halsted St & Roscoe St          Wabash Ave & Grand Ave     \n",
       "4410133 Blackstone Ave & Hyde Park Blvd Lake Park Ave & 47th St    \n",
       "4410134 Rush St & Hubbard St            Desplaines St & Randolph St\n",
       "4410135 Rush St & Hubbard St            Desplaines St & Randolph St\n",
       "4410136 Clark St & Armitage Ave         Wabash Ave & Grand Ave     \n",
       "4410137 Blackstone Ave & Hyde Park Blvd Lake Park Ave & 47th St    \n",
       "4410138 Sedgwick St & North Ave         Lincoln Ave & Roscoe St*   \n",
       "4410139 Clifton Ave & Armitage Ave      Lincoln Ave & Roscoe St*   \n",
       "4410140 Clifton Ave & Armitage Ave      Lincoln Ave & Roscoe St*   \n",
       "4410141 Sedgwick St & North Ave         Wabash Ave & Grand Ave     \n",
       "4410142 Sedgwick St & North Ave         Damen Ave & Clybourn Ave   \n",
       "4410143 Clark St & Armitage Ave         Wabash Ave & Grand Ave     \n",
       "        member_casual ride_length      date       day_of_week month day year\n",
       "1       casual         54.7500000 mins 2021-11-26 Friday      11    26  2021\n",
       "2       casual          7.0833333 mins 2021-11-15 Monday      11    15  2021\n",
       "3       casual         37.4333333 mins 2021-11-10 Wednesday   11    10  2021\n",
       "4       casual         19.6833333 mins 2021-11-09 Tuesday     11    09  2021\n",
       "5       casual         19.1500000 mins 2021-11-06 Saturday    11    06  2021\n",
       "6       casual         10.1833333 mins 2021-11-18 Thursday    11    18  2021\n",
       "7       casual         29.8333333 mins 2021-11-23 Tuesday     11    23  2021\n",
       "8       member          5.1333333 mins 2021-11-05 Friday      11    05  2021\n",
       "9       member          8.3000000 mins 2021-11-18 Thursday    11    18  2021\n",
       "10      member          3.6666667 mins 2021-11-14 Sunday      11    14  2021\n",
       "11      member          2.7500000 mins 2021-11-14 Sunday      11    14  2021\n",
       "12      member          0.5666667 mins 2021-11-28 Sunday      11    28  2021\n",
       "13      member          7.8333333 mins 2021-11-09 Tuesday     11    09  2021\n",
       "14      member         10.7333333 mins 2021-11-01 Monday      11    01  2021\n",
       "15      casual        131.6500000 mins 2021-11-07 Sunday      11    07  2021\n",
       "16      member          5.5166667 mins 2021-11-08 Monday      11    08  2021\n",
       "17      member          5.6333333 mins 2021-11-08 Monday      11    08  2021\n",
       "18      member         10.6666667 mins 2021-11-05 Friday      11    05  2021\n",
       "19      member          3.3666667 mins 2021-11-11 Thursday    11    11  2021\n",
       "20      member          3.0500000 mins 2021-11-13 Saturday    11    13  2021\n",
       "21      member          3.9000000 mins 2021-11-05 Friday      11    05  2021\n",
       "22      member          2.9833333 mins 2021-11-04 Thursday    11    04  2021\n",
       "23      member          2.9166667 mins 2021-11-11 Thursday    11    11  2021\n",
       "24      member         22.8000000 mins 2021-11-04 Thursday    11    04  2021\n",
       "25      member          2.3333333 mins 2021-11-15 Monday      11    15  2021\n",
       "26      member          1.1000000 mins 2021-11-01 Monday      11    01  2021\n",
       "27      member          3.0500000 mins 2021-11-16 Tuesday     11    16  2021\n",
       "28      member          3.2000000 mins 2021-11-15 Monday      11    15  2021\n",
       "29      member          3.1833333 mins 2021-11-15 Monday      11    15  2021\n",
       "30      member          1.1000000 mins 2021-11-28 Sunday      11    28  2021\n",
       "⋮       ⋮             ⋮                ⋮          ⋮           ⋮     ⋮   ⋮   \n",
       "4410114 member        18.066667 mins   2022-10-15 Saturday    10    15  2022\n",
       "4410115 casual        22.483333 mins   2022-10-22 Saturday    10    22  2022\n",
       "4410116 casual        36.566667 mins   2022-10-09 Sunday      10    09  2022\n",
       "4410117 casual        53.533333 mins   2022-10-29 Saturday    10    29  2022\n",
       "4410118 member        25.400000 mins   2022-10-19 Wednesday   10    19  2022\n",
       "4410119 member        18.366667 mins   2022-10-30 Sunday      10    30  2022\n",
       "4410120 member         0.850000 mins   2022-10-18 Tuesday     10    18  2022\n",
       "4410121 member         5.066667 mins   2022-10-05 Wednesday   10    05  2022\n",
       "4410122 member        14.750000 mins   2022-10-18 Tuesday     10    18  2022\n",
       "4410123 member         8.833333 mins   2022-10-28 Friday      10    28  2022\n",
       "4410124 casual         8.516667 mins   2022-10-30 Sunday      10    30  2022\n",
       "4410125 casual        10.633333 mins   2022-10-30 Sunday      10    30  2022\n",
       "4410126 member        22.616667 mins   2022-10-21 Friday      10    21  2022\n",
       "4410127 member         7.966667 mins   2022-10-10 Monday      10    10  2022\n",
       "4410128 casual        29.266667 mins   2022-10-22 Saturday    10    22  2022\n",
       "4410129 member        18.400000 mins   2022-10-20 Thursday    10    20  2022\n",
       "4410130 member         5.983333 mins   2022-10-07 Friday      10    07  2022\n",
       "4410131 member        15.383333 mins   2022-10-28 Friday      10    28  2022\n",
       "4410132 casual        30.583333 mins   2022-10-01 Saturday    10    01  2022\n",
       "4410133 member         7.266667 mins   2022-10-28 Friday      10    28  2022\n",
       "4410134 casual        13.233333 mins   2022-10-22 Saturday    10    22  2022\n",
       "4410135 casual        13.116667 mins   2022-10-19 Wednesday   10    19  2022\n",
       "4410136 casual        29.150000 mins   2022-10-22 Saturday    10    22  2022\n",
       "4410137 member         2.733333 mins   2022-10-16 Sunday      10    16  2022\n",
       "4410138 member         2.400000 mins   2022-10-24 Monday      10    24  2022\n",
       "4410139 casual        15.783333 mins   2022-10-30 Sunday      10    30  2022\n",
       "4410140 casual        15.250000 mins   2022-10-30 Sunday      10    30  2022\n",
       "4410141 casual        29.166667 mins   2022-10-15 Saturday    10    15  2022\n",
       "4410142 member        22.183333 mins   2022-10-09 Sunday      10    09  2022\n",
       "4410143 casual        29.016667 mins   2022-10-22 Saturday    10    22  2022\n",
       "        time     hour season time_of_day\n",
       "1       10:27:28 10   Fall   Morning    \n",
       "2       09:35:03  9   Fall   Morning    \n",
       "3       16:27:02 16   Fall   Afternoon  \n",
       "4       19:51:36 19   Fall   Evening    \n",
       "5       19:14:10 19   Fall   Evening    \n",
       "6       11:58:24 11   Fall   Morning    \n",
       "7       22:14:11 22   Fall   Evening    \n",
       "8       16:48:10 16   Fall   Afternoon  \n",
       "9       08:40:38  8   Fall   Morning    \n",
       "10      20:29:33 20   Fall   Evening    \n",
       "11      18:36:11 18   Fall   Evening    \n",
       "12      15:29:12 15   Fall   Afternoon  \n",
       "13      08:25:59  8   Fall   Morning    \n",
       "14      14:19:54 14   Fall   Afternoon  \n",
       "15      14:39:41 14   Fall   Afternoon  \n",
       "16      14:46:14 14   Fall   Afternoon  \n",
       "17      13:51:35 13   Fall   Afternoon  \n",
       "18      16:14:05 16   Fall   Afternoon  \n",
       "19      17:54:18 17   Fall   Afternoon  \n",
       "20      19:41:36 19   Fall   Evening    \n",
       "21      17:33:40 17   Fall   Afternoon  \n",
       "22      07:30:25  7   Fall   Morning    \n",
       "23      10:56:12 10   Fall   Morning    \n",
       "24      18:00:47 18   Fall   Evening    \n",
       "25      20:04:24 20   Fall   Evening    \n",
       "26      15:49:36 15   Fall   Afternoon  \n",
       "27      19:01:36 19   Fall   Evening    \n",
       "28      18:53:47 18   Fall   Evening    \n",
       "29      20:51:53 20   Fall   Evening    \n",
       "30      14:18:18 14   Fall   Afternoon  \n",
       "⋮       ⋮        ⋮    ⋮      ⋮          \n",
       "4410114 14:25:55 14   Fall   Afternoon  \n",
       "4410115 11:45:36 11   Fall   Morning    \n",
       "4410116 08:46:51  8   Fall   Morning    \n",
       "4410117 10:32:34 10   Fall   Morning    \n",
       "4410118 15:07:34 15   Fall   Afternoon  \n",
       "4410119 11:41:59 11   Fall   Morning    \n",
       "4410120 21:56:49 21   Fall   Evening    \n",
       "4410121 13:18:15 13   Fall   Afternoon  \n",
       "4410122 14:30:58 14   Fall   Afternoon  \n",
       "4410123 13:22:41 13   Fall   Afternoon  \n",
       "4410124 16:35:18 16   Fall   Afternoon  \n",
       "4410125 23:16:31 23   Fall   Evening    \n",
       "4410126 08:50:25  8   Fall   Morning    \n",
       "4410127 17:00:33 17   Fall   Afternoon  \n",
       "4410128 13:16:48 13   Fall   Afternoon  \n",
       "4410129 18:21:05 18   Fall   Evening    \n",
       "4410130 17:01:45 17   Fall   Afternoon  \n",
       "4410131 16:22:14 16   Fall   Afternoon  \n",
       "4410132 21:57:14 21   Fall   Evening    \n",
       "4410133 10:54:37 10   Fall   Morning    \n",
       "4410134 18:32:35 18   Fall   Evening    \n",
       "4410135 07:27:19  7   Fall   Morning    \n",
       "4410136 13:17:09 13   Fall   Afternoon  \n",
       "4410137 14:50:27 14   Fall   Afternoon  \n",
       "4410138 17:45:38 17   Fall   Afternoon  \n",
       "4410139 01:41:29  1   Fall   Night      \n",
       "4410140 01:41:54  1   Fall   Night      \n",
       "4410141 09:34:11  9   Fall   Morning    \n",
       "4410142 10:21:34 10   Fall   Morning    \n",
       "4410143 13:17:13 13   Fall   Afternoon  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "View(cyclistic_data)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e4fc2fb1",
   "metadata": {
    "papermill": {
     "duration": 0.011074,
     "end_time": "2022-12-01T10:55:06.051573",
     "exception": false,
     "start_time": "2022-12-01T10:55:06.040499",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Total rides**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "5f4e008a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-01T10:55:06.076992Z",
     "iopub.status.busy": "2022-12-01T10:55:06.075493Z",
     "iopub.status.idle": "2022-12-01T10:55:06.092020Z",
     "shell.execute_reply": "2022-12-01T10:55:06.090508Z"
    },
    "papermill": {
     "duration": 0.031845,
     "end_time": "2022-12-01T10:55:06.094300",
     "exception": false,
     "start_time": "2022-12-01T10:55:06.062455",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "4410143"
      ],
      "text/latex": [
       "4410143"
      ],
      "text/markdown": [
       "4410143"
      ],
      "text/plain": [
       "[1] 4410143"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#total number of rides \n",
    "nrow(cyclistic_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "def0d85f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-01T10:55:06.120931Z",
     "iopub.status.busy": "2022-12-01T10:55:06.119388Z",
     "iopub.status.idle": "2022-12-01T10:55:06.366630Z",
     "shell.execute_reply": "2022-12-01T10:55:06.364993Z"
    },
    "papermill": {
     "duration": 0.263755,
     "end_time": "2022-12-01T10:55:06.368891",
     "exception": false,
     "start_time": "2022-12-01T10:55:06.105136",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>n</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>1768046</td></tr>\n",
       "\t<tr><td>member</td><td>2642097</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " member\\_casual & n\\\\\n",
       " <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t casual & 1768046\\\\\n",
       "\t member & 2642097\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 2 × 2\n",
       "\n",
       "| member_casual &lt;chr&gt; | n &lt;int&gt; |\n",
       "|---|---|\n",
       "| casual | 1768046 |\n",
       "| member | 2642097 |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual n      \n",
       "1 casual        1768046\n",
       "2 member        2642097"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Member Type\n",
    "cyclistic_data %>%\n",
    "  group_by(member_casual) %>%\n",
    "    count(member_casual)\n",
    "  "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "04b0cb86",
   "metadata": {
    "papermill": {
     "duration": 0.01092,
     "end_time": "2022-12-01T10:55:06.390887",
     "exception": false,
     "start_time": "2022-12-01T10:55:06.379967",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Type Of Bike**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "45c7beaa",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-01T10:55:06.415973Z",
     "iopub.status.busy": "2022-12-01T10:55:06.414447Z",
     "iopub.status.idle": "2022-12-01T10:55:06.862304Z",
     "shell.execute_reply": "2022-12-01T10:55:06.860605Z"
    },
    "papermill": {
     "duration": 0.462984,
     "end_time": "2022-12-01T10:55:06.864628",
     "exception": false,
     "start_time": "2022-12-01T10:55:06.401644",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 5 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>rideable_type</th><th scope=col>n</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>classic_bike </td><td> 894572</td></tr>\n",
       "\t<tr><td>casual</td><td>docked_bike  </td><td> 179624</td></tr>\n",
       "\t<tr><td>casual</td><td>electric_bike</td><td> 693850</td></tr>\n",
       "\t<tr><td>member</td><td>classic_bike </td><td>1738900</td></tr>\n",
       "\t<tr><td>member</td><td>electric_bike</td><td> 903197</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 5 × 3\n",
       "\\begin{tabular}{lll}\n",
       " member\\_casual & rideable\\_type & n\\\\\n",
       " <chr> & <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t casual & classic\\_bike  &  894572\\\\\n",
       "\t casual & docked\\_bike   &  179624\\\\\n",
       "\t casual & electric\\_bike &  693850\\\\\n",
       "\t member & classic\\_bike  & 1738900\\\\\n",
       "\t member & electric\\_bike &  903197\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 5 × 3\n",
       "\n",
       "| member_casual &lt;chr&gt; | rideable_type &lt;chr&gt; | n &lt;int&gt; |\n",
       "|---|---|---|\n",
       "| casual | classic_bike  |  894572 |\n",
       "| casual | docked_bike   |  179624 |\n",
       "| casual | electric_bike |  693850 |\n",
       "| member | classic_bike  | 1738900 |\n",
       "| member | electric_bike |  903197 |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual rideable_type n      \n",
       "1 casual        classic_bike   894572\n",
       "2 casual        docked_bike    179624\n",
       "3 casual        electric_bike  693850\n",
       "4 member        classic_bike  1738900\n",
       "5 member        electric_bike  903197"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#total rides by member type \n",
    "cyclistic_data %>%\n",
    "  group_by(member_casual, rideable_type) %>% \n",
    "  count(rideable_type)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "0bfa8dd9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-01T10:55:06.891365Z",
     "iopub.status.busy": "2022-12-01T10:55:06.889798Z",
     "iopub.status.idle": "2022-12-01T10:55:07.236804Z",
     "shell.execute_reply": "2022-12-01T10:55:07.234878Z"
    },
    "papermill": {
     "duration": 0.363108,
     "end_time": "2022-12-01T10:55:07.239479",
     "exception": false,
     "start_time": "2022-12-01T10:55:06.876371",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 3 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>rideable_type</th><th scope=col>n</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>classic_bike </td><td>2633472</td></tr>\n",
       "\t<tr><td>docked_bike  </td><td> 179624</td></tr>\n",
       "\t<tr><td>electric_bike</td><td>1597047</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 3 × 2\n",
       "\\begin{tabular}{ll}\n",
       " rideable\\_type & n\\\\\n",
       " <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t classic\\_bike  & 2633472\\\\\n",
       "\t docked\\_bike   &  179624\\\\\n",
       "\t electric\\_bike & 1597047\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 3 × 2\n",
       "\n",
       "| rideable_type &lt;chr&gt; | n &lt;int&gt; |\n",
       "|---|---|\n",
       "| classic_bike  | 2633472 |\n",
       "| docked_bike   |  179624 |\n",
       "| electric_bike | 1597047 |\n",
       "\n"
      ],
      "text/plain": [
       "  rideable_type n      \n",
       "1 classic_bike  2633472\n",
       "2 docked_bike    179624\n",
       "3 electric_bike 1597047"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#total rides \n",
    "cyclistic_data %>%\n",
    "  group_by(rideable_type) %>% \n",
    "  count(rideable_type)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2e709109",
   "metadata": {
    "papermill": {
     "duration": 0.011776,
     "end_time": "2022-12-01T10:55:07.262886",
     "exception": false,
     "start_time": "2022-12-01T10:55:07.251110",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**HOUR**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "2fe4b7ba",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-01T10:55:07.290227Z",
     "iopub.status.busy": "2022-12-01T10:55:07.288460Z",
     "iopub.status.idle": "2022-12-01T10:55:07.923007Z",
     "shell.execute_reply": "2022-12-01T10:55:07.920615Z"
    },
    "papermill": {
     "duration": 0.651414,
     "end_time": "2022-12-01T10:55:07.925711",
     "exception": false,
     "start_time": "2022-12-01T10:55:07.274297",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\u001b[90m# A tibble: 48 × 3\u001b[39m\n",
      "\u001b[90m# Groups:   member_casual [2]\u001b[39m\n",
      "   member_casual  hour      n\n",
      "   \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m         \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m  \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m\n",
      "\u001b[90m 1\u001b[39m casual            0  \u001b[4m3\u001b[24m\u001b[4m3\u001b[24m361\n",
      "\u001b[90m 2\u001b[39m casual            1  \u001b[4m2\u001b[24m\u001b[4m1\u001b[24m356\n",
      "\u001b[90m 3\u001b[39m casual            2  \u001b[4m1\u001b[24m\u001b[4m2\u001b[24m915\n",
      "\u001b[90m 4\u001b[39m casual            3   \u001b[4m7\u001b[24m283\n",
      "\u001b[90m 5\u001b[39m casual            4   \u001b[4m4\u001b[24m721\n",
      "\u001b[90m 6\u001b[39m casual            5   \u001b[4m8\u001b[24m504\n",
      "\u001b[90m 7\u001b[39m casual            6  \u001b[4m2\u001b[24m\u001b[4m1\u001b[24m254\n",
      "\u001b[90m 8\u001b[39m casual            7  \u001b[4m3\u001b[24m\u001b[4m7\u001b[24m519\n",
      "\u001b[90m 9\u001b[39m casual            8  \u001b[4m5\u001b[24m\u001b[4m1\u001b[24m373\n",
      "\u001b[90m10\u001b[39m casual            9  \u001b[4m5\u001b[24m\u001b[4m4\u001b[24m838\n",
      "\u001b[90m11\u001b[39m casual           10  \u001b[4m7\u001b[24m\u001b[4m3\u001b[24m011\n",
      "\u001b[90m12\u001b[39m casual           11  \u001b[4m9\u001b[24m\u001b[4m5\u001b[24m886\n",
      "\u001b[90m13\u001b[39m casual           12 \u001b[4m1\u001b[24m\u001b[4m1\u001b[24m\u001b[4m3\u001b[24m230\n",
      "\u001b[90m14\u001b[39m casual           13 \u001b[4m1\u001b[24m\u001b[4m1\u001b[24m\u001b[4m7\u001b[24m898\n",
      "\u001b[90m15\u001b[39m casual           14 \u001b[4m1\u001b[24m\u001b[4m2\u001b[24m\u001b[4m4\u001b[24m438\n",
      "\u001b[90m16\u001b[39m casual           15 \u001b[4m1\u001b[24m\u001b[4m3\u001b[24m\u001b[4m6\u001b[24m251\n",
      "\u001b[90m17\u001b[39m casual           16 \u001b[4m1\u001b[24m\u001b[4m5\u001b[24m\u001b[4m2\u001b[24m250\n",
      "\u001b[90m18\u001b[39m casual           17 \u001b[4m1\u001b[24m\u001b[4m7\u001b[24m\u001b[4m0\u001b[24m209\n",
      "\u001b[90m19\u001b[39m casual           18 \u001b[4m1\u001b[24m\u001b[4m5\u001b[24m\u001b[4m0\u001b[24m873\n",
      "\u001b[90m20\u001b[39m casual           19 \u001b[4m1\u001b[24m\u001b[4m1\u001b[24m\u001b[4m4\u001b[24m751\n",
      "\u001b[90m21\u001b[39m casual           20  \u001b[4m8\u001b[24m\u001b[4m3\u001b[24m477\n",
      "\u001b[90m22\u001b[39m casual           21  \u001b[4m7\u001b[24m\u001b[4m1\u001b[24m373\n",
      "\u001b[90m23\u001b[39m casual           22  \u001b[4m6\u001b[24m\u001b[4m4\u001b[24m156\n",
      "\u001b[90m24\u001b[39m casual           23  \u001b[4m4\u001b[24m\u001b[4m7\u001b[24m119\n",
      "\u001b[90m25\u001b[39m member            0  \u001b[4m2\u001b[24m\u001b[4m5\u001b[24m321\n",
      "\u001b[90m26\u001b[39m member            1  \u001b[4m1\u001b[24m\u001b[4m5\u001b[24m592\n",
      "\u001b[90m27\u001b[39m member            2   \u001b[4m8\u001b[24m592\n",
      "\u001b[90m28\u001b[39m member            3   \u001b[4m5\u001b[24m213\n",
      "\u001b[90m29\u001b[39m member            4   \u001b[4m6\u001b[24m138\n",
      "\u001b[90m30\u001b[39m member            5  \u001b[4m2\u001b[24m\u001b[4m6\u001b[24m968\n",
      "\u001b[90m31\u001b[39m member            6  \u001b[4m7\u001b[24m\u001b[4m6\u001b[24m382\n",
      "\u001b[90m32\u001b[39m member            7 \u001b[4m1\u001b[24m\u001b[4m4\u001b[24m\u001b[4m4\u001b[24m518\n",
      "\u001b[90m33\u001b[39m member            8 \u001b[4m1\u001b[24m\u001b[4m6\u001b[24m\u001b[4m8\u001b[24m711\n",
      "\u001b[90m34\u001b[39m member            9 \u001b[4m1\u001b[24m\u001b[4m1\u001b[24m\u001b[4m4\u001b[24m118\n",
      "\u001b[90m35\u001b[39m member           10 \u001b[4m1\u001b[24m\u001b[4m0\u001b[24m\u001b[4m6\u001b[24m132\n",
      "\u001b[90m36\u001b[39m member           11 \u001b[4m1\u001b[24m\u001b[4m2\u001b[24m\u001b[4m7\u001b[24m507\n",
      "\u001b[90m37\u001b[39m member           12 \u001b[4m1\u001b[24m\u001b[4m4\u001b[24m\u001b[4m6\u001b[24m783\n",
      "\u001b[90m38\u001b[39m member           13 \u001b[4m1\u001b[24m\u001b[4m4\u001b[24m\u001b[4m4\u001b[24m787\n",
      "\u001b[90m39\u001b[39m member           14 \u001b[4m1\u001b[24m\u001b[4m4\u001b[24m\u001b[4m4\u001b[24m116\n",
      "\u001b[90m40\u001b[39m member           15 \u001b[4m1\u001b[24m\u001b[4m7\u001b[24m\u001b[4m4\u001b[24m121\n",
      "\u001b[90m41\u001b[39m member           16 \u001b[4m2\u001b[24m\u001b[4m3\u001b[24m\u001b[4m4\u001b[24m287\n",
      "\u001b[90m42\u001b[39m member           17 \u001b[4m2\u001b[24m\u001b[4m8\u001b[24m\u001b[4m3\u001b[24m595\n",
      "\u001b[90m43\u001b[39m member           18 \u001b[4m2\u001b[24m\u001b[4m2\u001b[24m\u001b[4m6\u001b[24m164\n",
      "\u001b[90m44\u001b[39m member           19 \u001b[4m1\u001b[24m\u001b[4m6\u001b[24m\u001b[4m0\u001b[24m514\n",
      "\u001b[90m45\u001b[39m member           20 \u001b[4m1\u001b[24m\u001b[4m1\u001b[24m\u001b[4m1\u001b[24m650\n",
      "\u001b[90m46\u001b[39m member           21  \u001b[4m8\u001b[24m\u001b[4m5\u001b[24m572\n",
      "\u001b[90m47\u001b[39m member           22  \u001b[4m6\u001b[24m\u001b[4m4\u001b[24m377\n",
      "\u001b[90m48\u001b[39m member           23  \u001b[4m4\u001b[24m\u001b[4m0\u001b[24m939\n",
      "\u001b[90m# A tibble: 24 × 2\u001b[39m\n",
      "    hour      n\n",
      "   \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m  \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m\n",
      "\u001b[90m 1\u001b[39m     0  \u001b[4m5\u001b[24m\u001b[4m8\u001b[24m682\n",
      "\u001b[90m 2\u001b[39m     1  \u001b[4m3\u001b[24m\u001b[4m6\u001b[24m948\n",
      "\u001b[90m 3\u001b[39m     2  \u001b[4m2\u001b[24m\u001b[4m1\u001b[24m507\n",
      "\u001b[90m 4\u001b[39m     3  \u001b[4m1\u001b[24m\u001b[4m2\u001b[24m496\n",
      "\u001b[90m 5\u001b[39m     4  \u001b[4m1\u001b[24m\u001b[4m0\u001b[24m859\n",
      "\u001b[90m 6\u001b[39m     5  \u001b[4m3\u001b[24m\u001b[4m5\u001b[24m472\n",
      "\u001b[90m 7\u001b[39m     6  \u001b[4m9\u001b[24m\u001b[4m7\u001b[24m636\n",
      "\u001b[90m 8\u001b[39m     7 \u001b[4m1\u001b[24m\u001b[4m8\u001b[24m\u001b[4m2\u001b[24m037\n",
      "\u001b[90m 9\u001b[39m     8 \u001b[4m2\u001b[24m\u001b[4m2\u001b[24m\u001b[4m0\u001b[24m084\n",
      "\u001b[90m10\u001b[39m     9 \u001b[4m1\u001b[24m\u001b[4m6\u001b[24m\u001b[4m8\u001b[24m956\n",
      "\u001b[90m11\u001b[39m    10 \u001b[4m1\u001b[24m\u001b[4m7\u001b[24m\u001b[4m9\u001b[24m143\n",
      "\u001b[90m12\u001b[39m    11 \u001b[4m2\u001b[24m\u001b[4m2\u001b[24m\u001b[4m3\u001b[24m393\n",
      "\u001b[90m13\u001b[39m    12 \u001b[4m2\u001b[24m\u001b[4m6\u001b[24m\u001b[4m0\u001b[24m013\n",
      "\u001b[90m14\u001b[39m    13 \u001b[4m2\u001b[24m\u001b[4m6\u001b[24m\u001b[4m2\u001b[24m685\n",
      "\u001b[90m15\u001b[39m    14 \u001b[4m2\u001b[24m\u001b[4m6\u001b[24m\u001b[4m8\u001b[24m554\n",
      "\u001b[90m16\u001b[39m    15 \u001b[4m3\u001b[24m\u001b[4m1\u001b[24m\u001b[4m0\u001b[24m372\n",
      "\u001b[90m17\u001b[39m    16 \u001b[4m3\u001b[24m\u001b[4m8\u001b[24m\u001b[4m6\u001b[24m537\n",
      "\u001b[90m18\u001b[39m    17 \u001b[4m4\u001b[24m\u001b[4m5\u001b[24m\u001b[4m3\u001b[24m804\n",
      "\u001b[90m19\u001b[39m    18 \u001b[4m3\u001b[24m\u001b[4m7\u001b[24m\u001b[4m7\u001b[24m037\n",
      "\u001b[90m20\u001b[39m    19 \u001b[4m2\u001b[24m\u001b[4m7\u001b[24m\u001b[4m5\u001b[24m265\n",
      "\u001b[90m21\u001b[39m    20 \u001b[4m1\u001b[24m\u001b[4m9\u001b[24m\u001b[4m5\u001b[24m127\n",
      "\u001b[90m22\u001b[39m    21 \u001b[4m1\u001b[24m\u001b[4m5\u001b[24m\u001b[4m6\u001b[24m945\n",
      "\u001b[90m23\u001b[39m    22 \u001b[4m1\u001b[24m\u001b[4m2\u001b[24m\u001b[4m8\u001b[24m533\n",
      "\u001b[90m24\u001b[39m    23  \u001b[4m8\u001b[24m\u001b[4m8\u001b[24m058\n"
     ]
    }
   ],
   "source": [
    "#total rides by member type \n",
    "cyclistic_data %>%\n",
    "  group_by(member_casual) %>% \n",
    "  count(hour) %>% \n",
    "  print(n = 48) \n",
    "\n",
    "#total rides\n",
    "cyclistic_data %>%\n",
    "  count(hour) %>% \n",
    "  print(n = 24) "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ca2c387a",
   "metadata": {
    "papermill": {
     "duration": 0.012589,
     "end_time": "2022-12-01T10:55:07.950505",
     "exception": false,
     "start_time": "2022-12-01T10:55:07.937916",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Time of the Day**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "e5f9953a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-01T10:55:07.977832Z",
     "iopub.status.busy": "2022-12-01T10:55:07.975969Z",
     "iopub.status.idle": "2022-12-01T10:55:14.365909Z",
     "shell.execute_reply": "2022-12-01T10:55:14.364288Z"
    },
    "papermill": {
     "duration": 6.406372,
     "end_time": "2022-12-01T10:55:14.368393",
     "exception": false,
     "start_time": "2022-12-01T10:55:07.962021",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 2 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>time_of_day</th><th scope=col>n</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Morning</td><td>333881</td></tr>\n",
       "\t<tr><td>member</td><td>Morning</td><td>737368</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 2 × 3\n",
       "\\begin{tabular}{lll}\n",
       " member\\_casual & time\\_of\\_day & n\\\\\n",
       " <chr> & <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t casual & Morning & 333881\\\\\n",
       "\t member & Morning & 737368\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 2 × 3\n",
       "\n",
       "| member_casual &lt;chr&gt; | time_of_day &lt;chr&gt; | n &lt;int&gt; |\n",
       "|---|---|---|\n",
       "| casual | Morning | 333881 |\n",
       "| member | Morning | 737368 |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual time_of_day n     \n",
       "1 casual        Morning     333881\n",
       "2 member        Morning     737368"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 1 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>time_of_day</th><th scope=col>n</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Morning</td><td>1071249</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 1 × 2\n",
       "\\begin{tabular}{ll}\n",
       " time\\_of\\_day & n\\\\\n",
       " <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t Morning & 1071249\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 1 × 2\n",
       "\n",
       "| time_of_day &lt;chr&gt; | n &lt;int&gt; |\n",
       "|---|---|\n",
       "| Morning | 1071249 |\n",
       "\n"
      ],
      "text/plain": [
       "  time_of_day n      \n",
       "1 Morning     1071249"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 2 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>time_of_day</th><th scope=col>n</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Afternoon</td><td> 814276</td></tr>\n",
       "\t<tr><td>member</td><td>Afternoon</td><td>1127689</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 2 × 3\n",
       "\\begin{tabular}{lll}\n",
       " member\\_casual & time\\_of\\_day & n\\\\\n",
       " <chr> & <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t casual & Afternoon &  814276\\\\\n",
       "\t member & Afternoon & 1127689\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 2 × 3\n",
       "\n",
       "| member_casual &lt;chr&gt; | time_of_day &lt;chr&gt; | n &lt;int&gt; |\n",
       "|---|---|---|\n",
       "| casual | Afternoon |  814276 |\n",
       "| member | Afternoon | 1127689 |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual time_of_day n      \n",
       "1 casual        Afternoon    814276\n",
       "2 member        Afternoon   1127689"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 1 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>time_of_day</th><th scope=col>n</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Afternoon</td><td>1941965</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 1 × 2\n",
       "\\begin{tabular}{ll}\n",
       " time\\_of\\_day & n\\\\\n",
       " <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t Afternoon & 1941965\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 1 × 2\n",
       "\n",
       "| time_of_day &lt;chr&gt; | n &lt;int&gt; |\n",
       "|---|---|\n",
       "| Afternoon | 1941965 |\n",
       "\n"
      ],
      "text/plain": [
       "  time_of_day n      \n",
       "1 Afternoon   1941965"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 2 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>time_of_day</th><th scope=col>n</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Evening</td><td>531749</td></tr>\n",
       "\t<tr><td>member</td><td>Evening</td><td>689216</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 2 × 3\n",
       "\\begin{tabular}{lll}\n",
       " member\\_casual & time\\_of\\_day & n\\\\\n",
       " <chr> & <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t casual & Evening & 531749\\\\\n",
       "\t member & Evening & 689216\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 2 × 3\n",
       "\n",
       "| member_casual &lt;chr&gt; | time_of_day &lt;chr&gt; | n &lt;int&gt; |\n",
       "|---|---|---|\n",
       "| casual | Evening | 531749 |\n",
       "| member | Evening | 689216 |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual time_of_day n     \n",
       "1 casual        Evening     531749\n",
       "2 member        Evening     689216"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 1 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>time_of_day</th><th scope=col>n</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Evening</td><td>1220965</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 1 × 2\n",
       "\\begin{tabular}{ll}\n",
       " time\\_of\\_day & n\\\\\n",
       " <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t Evening & 1220965\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 1 × 2\n",
       "\n",
       "| time_of_day &lt;chr&gt; | n &lt;int&gt; |\n",
       "|---|---|\n",
       "| Evening | 1220965 |\n",
       "\n"
      ],
      "text/plain": [
       "  time_of_day n      \n",
       "1 Evening     1220965"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 2 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>time_of_day</th><th scope=col>n</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Night</td><td>88140</td></tr>\n",
       "\t<tr><td>member</td><td>Night</td><td>87824</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 2 × 3\n",
       "\\begin{tabular}{lll}\n",
       " member\\_casual & time\\_of\\_day & n\\\\\n",
       " <chr> & <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t casual & Night & 88140\\\\\n",
       "\t member & Night & 87824\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 2 × 3\n",
       "\n",
       "| member_casual &lt;chr&gt; | time_of_day &lt;chr&gt; | n &lt;int&gt; |\n",
       "|---|---|---|\n",
       "| casual | Night | 88140 |\n",
       "| member | Night | 87824 |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual time_of_day n    \n",
       "1 casual        Night       88140\n",
       "2 member        Night       87824"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 1 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>time_of_day</th><th scope=col>n</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Night</td><td>175964</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 1 × 2\n",
       "\\begin{tabular}{ll}\n",
       " time\\_of\\_day & n\\\\\n",
       " <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t Night & 175964\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 1 × 2\n",
       "\n",
       "| time_of_day &lt;chr&gt; | n &lt;int&gt; |\n",
       "|---|---|\n",
       "| Night | 175964 |\n",
       "\n"
      ],
      "text/plain": [
       "  time_of_day n     \n",
       "1 Night       175964"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 8 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>time_of_day</th><th scope=col>n</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Afternoon</td><td> 814276</td></tr>\n",
       "\t<tr><td>casual</td><td>Evening  </td><td> 531749</td></tr>\n",
       "\t<tr><td>casual</td><td>Morning  </td><td> 333881</td></tr>\n",
       "\t<tr><td>casual</td><td>Night    </td><td>  88140</td></tr>\n",
       "\t<tr><td>member</td><td>Afternoon</td><td>1127689</td></tr>\n",
       "\t<tr><td>member</td><td>Evening  </td><td> 689216</td></tr>\n",
       "\t<tr><td>member</td><td>Morning  </td><td> 737368</td></tr>\n",
       "\t<tr><td>member</td><td>Night    </td><td>  87824</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 8 × 3\n",
       "\\begin{tabular}{lll}\n",
       " member\\_casual & time\\_of\\_day & n\\\\\n",
       " <chr> & <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t casual & Afternoon &  814276\\\\\n",
       "\t casual & Evening   &  531749\\\\\n",
       "\t casual & Morning   &  333881\\\\\n",
       "\t casual & Night     &   88140\\\\\n",
       "\t member & Afternoon & 1127689\\\\\n",
       "\t member & Evening   &  689216\\\\\n",
       "\t member & Morning   &  737368\\\\\n",
       "\t member & Night     &   87824\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 8 × 3\n",
       "\n",
       "| member_casual &lt;chr&gt; | time_of_day &lt;chr&gt; | n &lt;int&gt; |\n",
       "|---|---|---|\n",
       "| casual | Afternoon |  814276 |\n",
       "| casual | Evening   |  531749 |\n",
       "| casual | Morning   |  333881 |\n",
       "| casual | Night     |   88140 |\n",
       "| member | Afternoon | 1127689 |\n",
       "| member | Evening   |  689216 |\n",
       "| member | Morning   |  737368 |\n",
       "| member | Night     |   87824 |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual time_of_day n      \n",
       "1 casual        Afternoon    814276\n",
       "2 casual        Evening      531749\n",
       "3 casual        Morning      333881\n",
       "4 casual        Night         88140\n",
       "5 member        Afternoon   1127689\n",
       "6 member        Evening      689216\n",
       "7 member        Morning      737368\n",
       "8 member        Night         87824"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 4 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>time_of_day</th><th scope=col>n</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Afternoon</td><td>1941965</td></tr>\n",
       "\t<tr><td>Evening  </td><td>1220965</td></tr>\n",
       "\t<tr><td>Morning  </td><td>1071249</td></tr>\n",
       "\t<tr><td>Night    </td><td> 175964</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 4 × 2\n",
       "\\begin{tabular}{ll}\n",
       " time\\_of\\_day & n\\\\\n",
       " <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t Afternoon & 1941965\\\\\n",
       "\t Evening   & 1220965\\\\\n",
       "\t Morning   & 1071249\\\\\n",
       "\t Night     &  175964\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 4 × 2\n",
       "\n",
       "| time_of_day &lt;chr&gt; | n &lt;int&gt; |\n",
       "|---|---|\n",
       "| Afternoon | 1941965 |\n",
       "| Evening   | 1220965 |\n",
       "| Morning   | 1071249 |\n",
       "| Night     |  175964 |\n",
       "\n"
      ],
      "text/plain": [
       "  time_of_day n      \n",
       "1 Afternoon   1941965\n",
       "2 Evening     1220965\n",
       "3 Morning     1071249\n",
       "4 Night        175964"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#-----morning-------\n",
    "#total rides by member type \n",
    "cyclistic_data %>%\n",
    "  group_by(member_casual) %>% \n",
    "  filter(time_of_day == \"Morning\") %>% \n",
    "  count(time_of_day)\n",
    "\n",
    "#total rides\n",
    "cyclistic_data %>%\n",
    "  filter(time_of_day == \"Morning\") %>% \n",
    "  count(time_of_day)\n",
    "\n",
    "#-----afternoon-------\n",
    "#total rides by member type \n",
    "cyclistic_data %>%\n",
    "  group_by(member_casual) %>% \n",
    "  filter(time_of_day == \"Afternoon\") %>% \n",
    "  count(time_of_day)\n",
    "\n",
    "#total rides \n",
    "cyclistic_data %>%\n",
    "  filter(time_of_day == \"Afternoon\") %>% \n",
    "  count(time_of_day)\n",
    "\n",
    "#-----evening-------\n",
    "#total rides by member type\n",
    "cyclistic_data %>%\n",
    "  group_by(member_casual) %>% \n",
    "  filter(time_of_day == \"Evening\") %>% \n",
    "  count(time_of_day)\n",
    "\n",
    "#total rides\n",
    "cyclistic_data %>%\n",
    "  filter(time_of_day == \"Evening\") %>% \n",
    "  count(time_of_day)\n",
    "\n",
    "#-----night-------\n",
    "#number of rides by member type\n",
    "cyclistic_data %>%\n",
    "  group_by(member_casual) %>% \n",
    "  filter(time_of_day == \"Night\") %>% \n",
    "  count(time_of_day)\n",
    "\n",
    "#number of rides \n",
    "cyclistic_data %>%\n",
    "  filter(time_of_day == \"Night\") %>% \n",
    "  count(time_of_day)\n",
    "\n",
    "#---all times of day----\n",
    "#total rides by member type \n",
    "cyclistic_data %>%\n",
    "  group_by(member_casual) %>% \n",
    "  count(time_of_day)\n",
    "\n",
    "#number of rides\n",
    "cyclistic_data %>%\n",
    "  group_by(time_of_day) %>% \n",
    "  count(time_of_day)\n",
    "\n",
    "\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7eeae3c7",
   "metadata": {
    "papermill": {
     "duration": 0.013362,
     "end_time": "2022-12-01T10:55:14.395360",
     "exception": false,
     "start_time": "2022-12-01T10:55:14.381998",
     "status": "completed"
    },
    "tags": []
   },
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 166.634117,
   "end_time": "2022-12-01T10:55:14.730489",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-12-01T10:52:28.096372",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
