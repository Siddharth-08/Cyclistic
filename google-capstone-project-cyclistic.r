{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "6f6c9e30",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2022-12-05T12:42:57.157939Z",
     "iopub.status.busy": "2022-12-05T12:42:57.154331Z",
     "iopub.status.idle": "2022-12-05T12:42:58.929725Z",
     "shell.execute_reply": "2022-12-05T12:42:58.927654Z"
    },
    "papermill": {
     "duration": 1.793853,
     "end_time": "2022-12-05T12:42:58.932480",
     "exception": false,
     "start_time": "2022-12-05T12:42:57.138627",
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
   "id": "0eee552b",
   "metadata": {
    "papermill": {
     "duration": 0.010579,
     "end_time": "2022-12-05T12:42:58.954329",
     "exception": false,
     "start_time": "2022-12-05T12:42:58.943750",
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
   "id": "58509ea5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T12:42:59.013957Z",
     "iopub.status.busy": "2022-12-05T12:42:58.977793Z",
     "iopub.status.idle": "2022-12-05T12:44:45.502761Z",
     "shell.execute_reply": "2022-12-05T12:44:45.500754Z"
    },
    "papermill": {
     "duration": 106.541792,
     "end_time": "2022-12-05T12:44:45.506659",
     "exception": false,
     "start_time": "2022-12-05T12:42:58.964867",
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
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n",
      "also installing the dependency ‘vctrs’\n",
      "\n",
      "\n",
      "Warning message in install.packages(\"ggplot2\"):\n",
      "“installation of package ‘vctrs’ had non-zero exit status”\n",
      "Warning message in install.packages(\"ggplot2\"):\n",
      "“installation of package ‘ggplot2’ had non-zero exit status”\n",
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
    "install.packages(\"ggplot2\")\n",
    "library(tidyverse)\n",
    "library(hms)\n",
    "library(data.table)\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c72484ec",
   "metadata": {
    "papermill": {
     "duration": 0.013014,
     "end_time": "2022-12-05T12:44:45.537684",
     "exception": false,
     "start_time": "2022-12-05T12:44:45.524670",
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
   "id": "01213174",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T12:44:45.568464Z",
     "iopub.status.busy": "2022-12-05T12:44:45.566543Z",
     "iopub.status.idle": "2022-12-05T12:45:24.152457Z",
     "shell.execute_reply": "2022-12-05T12:45:24.149928Z"
    },
    "papermill": {
     "duration": 38.603676,
     "end_time": "2022-12-05T12:45:24.156338",
     "exception": false,
     "start_time": "2022-12-05T12:44:45.552662",
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
   "id": "f6a896cf",
   "metadata": {
    "papermill": {
     "duration": 0.01419,
     "end_time": "2022-12-05T12:45:24.185570",
     "exception": false,
     "start_time": "2022-12-05T12:45:24.171380",
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
   "id": "59053491",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T12:45:24.217146Z",
     "iopub.status.busy": "2022-12-05T12:45:24.215513Z",
     "iopub.status.idle": "2022-12-05T12:45:42.547882Z",
     "shell.execute_reply": "2022-12-05T12:45:42.545770Z"
    },
    "papermill": {
     "duration": 18.351275,
     "end_time": "2022-12-05T12:45:42.550504",
     "exception": false,
     "start_time": "2022-12-05T12:45:24.199229",
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
   "id": "4c34f13d",
   "metadata": {
    "papermill": {
     "duration": 0.013826,
     "end_time": "2022-12-05T12:45:42.578081",
     "exception": false,
     "start_time": "2022-12-05T12:45:42.564255",
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
   "id": "69be0e27",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T12:45:42.609185Z",
     "iopub.status.busy": "2022-12-05T12:45:42.607403Z",
     "iopub.status.idle": "2022-12-05T12:45:42.622267Z",
     "shell.execute_reply": "2022-12-05T12:45:42.620463Z"
    },
    "papermill": {
     "duration": 0.03324,
     "end_time": "2022-12-05T12:45:42.624779",
     "exception": false,
     "start_time": "2022-12-05T12:45:42.591539",
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
   "id": "9ffab6a6",
   "metadata": {
    "papermill": {
     "duration": 0.014331,
     "end_time": "2022-12-05T12:45:42.653780",
     "exception": false,
     "start_time": "2022-12-05T12:45:42.639449",
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
   "id": "16067d54",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T12:45:42.686948Z",
     "iopub.status.busy": "2022-12-05T12:45:42.685016Z",
     "iopub.status.idle": "2022-12-05T12:45:42.700354Z",
     "shell.execute_reply": "2022-12-05T12:45:42.698037Z"
    },
    "papermill": {
     "duration": 0.035477,
     "end_time": "2022-12-05T12:45:42.703076",
     "exception": false,
     "start_time": "2022-12-05T12:45:42.667599",
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
   "id": "5855dae0",
   "metadata": {
    "papermill": {
     "duration": 0.014039,
     "end_time": "2022-12-05T12:45:42.730717",
     "exception": false,
     "start_time": "2022-12-05T12:45:42.716678",
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
   "id": "778c350c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T12:45:42.762436Z",
     "iopub.status.busy": "2022-12-05T12:45:42.760733Z",
     "iopub.status.idle": "2022-12-05T12:45:42.908928Z",
     "shell.execute_reply": "2022-12-05T12:45:42.907022Z"
    },
    "papermill": {
     "duration": 0.166826,
     "end_time": "2022-12-05T12:45:42.911347",
     "exception": false,
     "start_time": "2022-12-05T12:45:42.744521",
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
   "id": "22ca68f1",
   "metadata": {
    "papermill": {
     "duration": 0.020716,
     "end_time": "2022-12-05T12:45:42.946410",
     "exception": false,
     "start_time": "2022-12-05T12:45:42.925694",
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
   "id": "53d2186b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T12:45:42.990600Z",
     "iopub.status.busy": "2022-12-05T12:45:42.987687Z",
     "iopub.status.idle": "2022-12-05T12:45:59.680861Z",
     "shell.execute_reply": "2022-12-05T12:45:59.677642Z"
    },
    "papermill": {
     "duration": 16.721471,
     "end_time": "2022-12-05T12:45:59.686137",
     "exception": false,
     "start_time": "2022-12-05T12:45:42.964666",
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
   "id": "6a9cc095",
   "metadata": {
    "papermill": {
     "duration": 0.022174,
     "end_time": "2022-12-05T12:45:59.730244",
     "exception": false,
     "start_time": "2022-12-05T12:45:59.708070",
     "status": "completed"
    },
    "tags": []
   },
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "0a7983c6",
   "metadata": {
    "papermill": {
     "duration": 0.013713,
     "end_time": "2022-12-05T12:45:59.757908",
     "exception": false,
     "start_time": "2022-12-05T12:45:59.744195",
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
   "id": "1d893527",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T12:45:59.790301Z",
     "iopub.status.busy": "2022-12-05T12:45:59.787916Z",
     "iopub.status.idle": "2022-12-05T12:46:05.460394Z",
     "shell.execute_reply": "2022-12-05T12:46:05.458215Z"
    },
    "papermill": {
     "duration": 5.691957,
     "end_time": "2022-12-05T12:46:05.463579",
     "exception": false,
     "start_time": "2022-12-05T12:45:59.771622",
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
   "id": "b454ae3f",
   "metadata": {
    "papermill": {
     "duration": 0.013361,
     "end_time": "2022-12-05T12:46:05.490858",
     "exception": false,
     "start_time": "2022-12-05T12:46:05.477497",
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
   "id": "3101c7a6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T12:46:05.521627Z",
     "iopub.status.busy": "2022-12-05T12:46:05.519592Z",
     "iopub.status.idle": "2022-12-05T12:46:19.171084Z",
     "shell.execute_reply": "2022-12-05T12:46:19.169228Z"
    },
    "papermill": {
     "duration": 13.670153,
     "end_time": "2022-12-05T12:46:19.174279",
     "exception": false,
     "start_time": "2022-12-05T12:46:05.504126",
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
   "id": "9f2ece4b",
   "metadata": {
    "papermill": {
     "duration": 0.013665,
     "end_time": "2022-12-05T12:46:19.202056",
     "exception": false,
     "start_time": "2022-12-05T12:46:19.188391",
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
   "id": "2ef1e9dd",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T12:46:19.233649Z",
     "iopub.status.busy": "2022-12-05T12:46:19.232084Z",
     "iopub.status.idle": "2022-12-05T12:46:30.213317Z",
     "shell.execute_reply": "2022-12-05T12:46:30.211276Z"
    },
    "papermill": {
     "duration": 10.999951,
     "end_time": "2022-12-05T12:46:30.216043",
     "exception": false,
     "start_time": "2022-12-05T12:46:19.216092",
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
   "id": "38cf9a47",
   "metadata": {
    "papermill": {
     "duration": 0.01363,
     "end_time": "2022-12-05T12:46:30.243255",
     "exception": false,
     "start_time": "2022-12-05T12:46:30.229625",
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
   "id": "3fd33ed6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T12:46:30.274212Z",
     "iopub.status.busy": "2022-12-05T12:46:30.272617Z",
     "iopub.status.idle": "2022-12-05T12:46:30.439708Z",
     "shell.execute_reply": "2022-12-05T12:46:30.437977Z"
    },
    "papermill": {
     "duration": 0.186539,
     "end_time": "2022-12-05T12:46:30.443202",
     "exception": false,
     "start_time": "2022-12-05T12:46:30.256663",
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
   "id": "c0a4d7d5",
   "metadata": {
    "papermill": {
     "duration": 0.015538,
     "end_time": "2022-12-05T12:46:30.474153",
     "exception": false,
     "start_time": "2022-12-05T12:46:30.458615",
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
   "id": "2f1ca37d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T12:46:30.509093Z",
     "iopub.status.busy": "2022-12-05T12:46:30.507481Z",
     "iopub.status.idle": "2022-12-05T12:46:30.525495Z",
     "shell.execute_reply": "2022-12-05T12:46:30.523758Z"
    },
    "papermill": {
     "duration": 0.038578,
     "end_time": "2022-12-05T12:46:30.528239",
     "exception": false,
     "start_time": "2022-12-05T12:46:30.489661",
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
   "id": "b2b449d8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T12:46:30.569541Z",
     "iopub.status.busy": "2022-12-05T12:46:30.567675Z",
     "iopub.status.idle": "2022-12-05T12:46:30.820092Z",
     "shell.execute_reply": "2022-12-05T12:46:30.818295Z"
    },
    "papermill": {
     "duration": 0.278549,
     "end_time": "2022-12-05T12:46:30.822612",
     "exception": false,
     "start_time": "2022-12-05T12:46:30.544063",
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
   "id": "bd08d3bd",
   "metadata": {
    "papermill": {
     "duration": 0.017393,
     "end_time": "2022-12-05T12:46:30.857845",
     "exception": false,
     "start_time": "2022-12-05T12:46:30.840452",
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
   "id": "3b7c0fc3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T12:46:30.893832Z",
     "iopub.status.busy": "2022-12-05T12:46:30.892214Z",
     "iopub.status.idle": "2022-12-05T12:46:31.285911Z",
     "shell.execute_reply": "2022-12-05T12:46:31.284096Z"
    },
    "papermill": {
     "duration": 0.41446,
     "end_time": "2022-12-05T12:46:31.288536",
     "exception": false,
     "start_time": "2022-12-05T12:46:30.874076",
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
   "id": "8cec9b97",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T12:46:31.325844Z",
     "iopub.status.busy": "2022-12-05T12:46:31.324060Z",
     "iopub.status.idle": "2022-12-05T12:46:32.180575Z",
     "shell.execute_reply": "2022-12-05T12:46:32.178871Z"
    },
    "papermill": {
     "duration": 0.878177,
     "end_time": "2022-12-05T12:46:32.183209",
     "exception": false,
     "start_time": "2022-12-05T12:46:31.305032",
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
   "id": "73c9c0b8",
   "metadata": {
    "papermill": {
     "duration": 0.016304,
     "end_time": "2022-12-05T12:46:32.215744",
     "exception": false,
     "start_time": "2022-12-05T12:46:32.199440",
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
   "id": "98c35fcc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T12:46:32.252395Z",
     "iopub.status.busy": "2022-12-05T12:46:32.250861Z",
     "iopub.status.idle": "2022-12-05T12:46:32.738110Z",
     "shell.execute_reply": "2022-12-05T12:46:32.734890Z"
    },
    "papermill": {
     "duration": 0.509858,
     "end_time": "2022-12-05T12:46:32.741904",
     "exception": false,
     "start_time": "2022-12-05T12:46:32.232046",
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
   "id": "10c341e7",
   "metadata": {
    "papermill": {
     "duration": 0.017686,
     "end_time": "2022-12-05T12:46:32.778664",
     "exception": false,
     "start_time": "2022-12-05T12:46:32.760978",
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
   "id": "4d641995",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T12:46:32.879474Z",
     "iopub.status.busy": "2022-12-05T12:46:32.877853Z",
     "iopub.status.idle": "2022-12-05T12:46:39.753158Z",
     "shell.execute_reply": "2022-12-05T12:46:39.751142Z"
    },
    "papermill": {
     "duration": 6.959472,
     "end_time": "2022-12-05T12:46:39.756100",
     "exception": false,
     "start_time": "2022-12-05T12:46:32.796628",
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
   "id": "1f583264",
   "metadata": {
    "papermill": {
     "duration": 0.019894,
     "end_time": "2022-12-05T12:46:39.795457",
     "exception": false,
     "start_time": "2022-12-05T12:46:39.775563",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**#.........DAY OF THE WEEK.........**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "94ff5552",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T12:46:39.838723Z",
     "iopub.status.busy": "2022-12-05T12:46:39.837027Z",
     "iopub.status.idle": "2022-12-05T12:46:40.732059Z",
     "shell.execute_reply": "2022-12-05T12:46:40.730389Z"
    },
    "papermill": {
     "duration": 0.919143,
     "end_time": "2022-12-05T12:46:40.734405",
     "exception": false,
     "start_time": "2022-12-05T12:46:39.815262",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 14 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>day_of_week</th><th scope=col>n</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Friday   </td><td>249695</td></tr>\n",
       "\t<tr><td>casual</td><td>Monday   </td><td>214264</td></tr>\n",
       "\t<tr><td>casual</td><td>Saturday </td><td>375113</td></tr>\n",
       "\t<tr><td>casual</td><td>Sunday   </td><td>306065</td></tr>\n",
       "\t<tr><td>casual</td><td>Thursday </td><td>225769</td></tr>\n",
       "\t<tr><td>casual</td><td>Tuesday  </td><td>194912</td></tr>\n",
       "\t<tr><td>casual</td><td>Wednesday</td><td>202228</td></tr>\n",
       "\t<tr><td>member</td><td>Friday   </td><td>365059</td></tr>\n",
       "\t<tr><td>member</td><td>Monday   </td><td>385906</td></tr>\n",
       "\t<tr><td>member</td><td>Saturday </td><td>345744</td></tr>\n",
       "\t<tr><td>member</td><td>Sunday   </td><td>303002</td></tr>\n",
       "\t<tr><td>member</td><td>Thursday </td><td>413445</td></tr>\n",
       "\t<tr><td>member</td><td>Tuesday  </td><td>413622</td></tr>\n",
       "\t<tr><td>member</td><td>Wednesday</td><td>415319</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 14 × 3\n",
       "\\begin{tabular}{lll}\n",
       " member\\_casual & day\\_of\\_week & n\\\\\n",
       " <chr> & <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t casual & Friday    & 249695\\\\\n",
       "\t casual & Monday    & 214264\\\\\n",
       "\t casual & Saturday  & 375113\\\\\n",
       "\t casual & Sunday    & 306065\\\\\n",
       "\t casual & Thursday  & 225769\\\\\n",
       "\t casual & Tuesday   & 194912\\\\\n",
       "\t casual & Wednesday & 202228\\\\\n",
       "\t member & Friday    & 365059\\\\\n",
       "\t member & Monday    & 385906\\\\\n",
       "\t member & Saturday  & 345744\\\\\n",
       "\t member & Sunday    & 303002\\\\\n",
       "\t member & Thursday  & 413445\\\\\n",
       "\t member & Tuesday   & 413622\\\\\n",
       "\t member & Wednesday & 415319\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 14 × 3\n",
       "\n",
       "| member_casual &lt;chr&gt; | day_of_week &lt;chr&gt; | n &lt;int&gt; |\n",
       "|---|---|---|\n",
       "| casual | Friday    | 249695 |\n",
       "| casual | Monday    | 214264 |\n",
       "| casual | Saturday  | 375113 |\n",
       "| casual | Sunday    | 306065 |\n",
       "| casual | Thursday  | 225769 |\n",
       "| casual | Tuesday   | 194912 |\n",
       "| casual | Wednesday | 202228 |\n",
       "| member | Friday    | 365059 |\n",
       "| member | Monday    | 385906 |\n",
       "| member | Saturday  | 345744 |\n",
       "| member | Sunday    | 303002 |\n",
       "| member | Thursday  | 413445 |\n",
       "| member | Tuesday   | 413622 |\n",
       "| member | Wednesday | 415319 |\n",
       "\n"
      ],
      "text/plain": [
       "   member_casual day_of_week n     \n",
       "1  casual        Friday      249695\n",
       "2  casual        Monday      214264\n",
       "3  casual        Saturday    375113\n",
       "4  casual        Sunday      306065\n",
       "5  casual        Thursday    225769\n",
       "6  casual        Tuesday     194912\n",
       "7  casual        Wednesday   202228\n",
       "8  member        Friday      365059\n",
       "9  member        Monday      385906\n",
       "10 member        Saturday    345744\n",
       "11 member        Sunday      303002\n",
       "12 member        Thursday    413445\n",
       "13 member        Tuesday     413622\n",
       "14 member        Wednesday   415319"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 7 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>day_of_week</th><th scope=col>n</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Friday   </td><td>614754</td></tr>\n",
       "\t<tr><td>Monday   </td><td>600170</td></tr>\n",
       "\t<tr><td>Saturday </td><td>720857</td></tr>\n",
       "\t<tr><td>Sunday   </td><td>609067</td></tr>\n",
       "\t<tr><td>Thursday </td><td>639214</td></tr>\n",
       "\t<tr><td>Tuesday  </td><td>608534</td></tr>\n",
       "\t<tr><td>Wednesday</td><td>617547</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 7 × 2\n",
       "\\begin{tabular}{ll}\n",
       " day\\_of\\_week & n\\\\\n",
       " <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t Friday    & 614754\\\\\n",
       "\t Monday    & 600170\\\\\n",
       "\t Saturday  & 720857\\\\\n",
       "\t Sunday    & 609067\\\\\n",
       "\t Thursday  & 639214\\\\\n",
       "\t Tuesday   & 608534\\\\\n",
       "\t Wednesday & 617547\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 7 × 2\n",
       "\n",
       "| day_of_week &lt;chr&gt; | n &lt;int&gt; |\n",
       "|---|---|\n",
       "| Friday    | 614754 |\n",
       "| Monday    | 600170 |\n",
       "| Saturday  | 720857 |\n",
       "| Sunday    | 609067 |\n",
       "| Thursday  | 639214 |\n",
       "| Tuesday   | 608534 |\n",
       "| Wednesday | 617547 |\n",
       "\n"
      ],
      "text/plain": [
       "  day_of_week n     \n",
       "1 Friday      614754\n",
       "2 Monday      600170\n",
       "3 Saturday    720857\n",
       "4 Sunday      609067\n",
       "5 Thursday    639214\n",
       "6 Tuesday     608534\n",
       "7 Wednesday   617547"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#total rides by member type\n",
    "cyclistic_data %>%\n",
    "  group_by(member_casual) %>% \n",
    "  count(day_of_week)\n",
    "\n",
    "#total rides \n",
    "cyclistic_data %>%\n",
    "  count(day_of_week)\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "fb1a7034",
   "metadata": {
    "papermill": {
     "duration": 0.019126,
     "end_time": "2022-12-05T12:46:40.772843",
     "exception": false,
     "start_time": "2022-12-05T12:46:40.753717",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**#.....DAY OF THE MONTH.....**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "id": "4b58875f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T12:46:40.814297Z",
     "iopub.status.busy": "2022-12-05T12:46:40.812710Z",
     "iopub.status.idle": "2022-12-05T12:46:41.283256Z",
     "shell.execute_reply": "2022-12-05T12:46:41.280706Z"
    },
    "papermill": {
     "duration": 0.494704,
     "end_time": "2022-12-05T12:46:41.286189",
     "exception": false,
     "start_time": "2022-12-05T12:46:40.791485",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\u001b[90m# A tibble: 62 × 3\u001b[39m\n",
      "\u001b[90m# Groups:   member_casual [2]\u001b[39m\n",
      "   member_casual day       n\n",
      "   \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m         \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m\n",
      "\u001b[90m 1\u001b[39m casual        01    \u001b[4m5\u001b[24m\u001b[4m3\u001b[24m061\n",
      "\u001b[90m 2\u001b[39m casual        02    \u001b[4m5\u001b[24m\u001b[4m7\u001b[24m843\n",
      "\u001b[90m 3\u001b[39m casual        03    \u001b[4m6\u001b[24m\u001b[4m0\u001b[24m122\n",
      "\u001b[90m 4\u001b[39m casual        04    \u001b[4m5\u001b[24m\u001b[4m5\u001b[24m113\n",
      "\u001b[90m 5\u001b[39m casual        05    \u001b[4m6\u001b[24m\u001b[4m1\u001b[24m984\n",
      "\u001b[90m 6\u001b[39m casual        06    \u001b[4m4\u001b[24m\u001b[4m8\u001b[24m697\n",
      "\u001b[90m 7\u001b[39m casual        07    \u001b[4m4\u001b[24m\u001b[4m9\u001b[24m584\n",
      "\u001b[90m 8\u001b[39m casual        08    \u001b[4m4\u001b[24m\u001b[4m3\u001b[24m752\n",
      "\u001b[90m 9\u001b[39m casual        09    \u001b[4m6\u001b[24m\u001b[4m8\u001b[24m454\n",
      "\u001b[90m10\u001b[39m casual        10    \u001b[4m6\u001b[24m\u001b[4m8\u001b[24m642\n",
      "\u001b[90m11\u001b[39m casual        11    \u001b[4m5\u001b[24m\u001b[4m2\u001b[24m813\n",
      "\u001b[90m12\u001b[39m casual        12    \u001b[4m5\u001b[24m\u001b[4m5\u001b[24m322\n",
      "\u001b[90m13\u001b[39m casual        13    \u001b[4m5\u001b[24m\u001b[4m9\u001b[24m757\n",
      "\u001b[90m14\u001b[39m casual        14    \u001b[4m6\u001b[24m\u001b[4m2\u001b[24m567\n",
      "\u001b[90m15\u001b[39m casual        15    \u001b[4m5\u001b[24m\u001b[4m0\u001b[24m822\n",
      "\u001b[90m16\u001b[39m casual        16    \u001b[4m6\u001b[24m\u001b[4m7\u001b[24m979\n",
      "\u001b[90m17\u001b[39m casual        17    \u001b[4m6\u001b[24m\u001b[4m0\u001b[24m421\n",
      "\u001b[90m18\u001b[39m casual        18    \u001b[4m5\u001b[24m\u001b[4m4\u001b[24m973\n",
      "\u001b[90m19\u001b[39m casual        19    \u001b[4m5\u001b[24m\u001b[4m8\u001b[24m900\n",
      "\u001b[90m20\u001b[39m casual        20    \u001b[4m6\u001b[24m\u001b[4m0\u001b[24m633\n",
      "\u001b[90m21\u001b[39m casual        21    \u001b[4m6\u001b[24m\u001b[4m2\u001b[24m597\n",
      "\u001b[90m22\u001b[39m casual        22    \u001b[4m5\u001b[24m\u001b[4m7\u001b[24m894\n",
      "\u001b[90m23\u001b[39m casual        23    \u001b[4m7\u001b[24m\u001b[4m0\u001b[24m990\n",
      "\u001b[90m24\u001b[39m casual        24    \u001b[4m6\u001b[24m\u001b[4m0\u001b[24m098\n",
      "\u001b[90m25\u001b[39m casual        25    \u001b[4m4\u001b[24m\u001b[4m2\u001b[24m301\n",
      "\u001b[90m26\u001b[39m casual        26    \u001b[4m5\u001b[24m\u001b[4m3\u001b[24m992\n",
      "\u001b[90m27\u001b[39m casual        27    \u001b[4m4\u001b[24m\u001b[4m9\u001b[24m858\n",
      "\u001b[90m28\u001b[39m casual        28    \u001b[4m5\u001b[24m\u001b[4m8\u001b[24m100\n",
      "\u001b[90m29\u001b[39m casual        29    \u001b[4m6\u001b[24m\u001b[4m3\u001b[24m110\n",
      "\u001b[90m30\u001b[39m casual        30    \u001b[4m6\u001b[24m\u001b[4m4\u001b[24m607\n",
      "\u001b[90m31\u001b[39m casual        31    \u001b[4m3\u001b[24m\u001b[4m3\u001b[24m060\n",
      "\u001b[90m32\u001b[39m member        01    \u001b[4m8\u001b[24m\u001b[4m9\u001b[24m766\n",
      "\u001b[90m33\u001b[39m member        02    \u001b[4m8\u001b[24m\u001b[4m7\u001b[24m273\n",
      "\u001b[90m34\u001b[39m member        03    \u001b[4m8\u001b[24m\u001b[4m1\u001b[24m900\n",
      "\u001b[90m35\u001b[39m member        04    \u001b[4m8\u001b[24m\u001b[4m3\u001b[24m096\n",
      "\u001b[90m36\u001b[39m member        05    \u001b[4m8\u001b[24m\u001b[4m2\u001b[24m576\n",
      "\u001b[90m37\u001b[39m member        06    \u001b[4m7\u001b[24m\u001b[4m8\u001b[24m712\n",
      "\u001b[90m38\u001b[39m member        07    \u001b[4m8\u001b[24m\u001b[4m1\u001b[24m545\n",
      "\u001b[90m39\u001b[39m member        08    \u001b[4m8\u001b[24m\u001b[4m1\u001b[24m774\n",
      "\u001b[90m40\u001b[39m member        09    \u001b[4m9\u001b[24m\u001b[4m8\u001b[24m189\n",
      "\u001b[90m41\u001b[39m member        10    \u001b[4m9\u001b[24m\u001b[4m6\u001b[24m117\n",
      "\u001b[90m42\u001b[39m member        11    \u001b[4m8\u001b[24m\u001b[4m2\u001b[24m838\n",
      "\u001b[90m43\u001b[39m member        12    \u001b[4m8\u001b[24m\u001b[4m8\u001b[24m555\n",
      "\u001b[90m44\u001b[39m member        13    \u001b[4m9\u001b[24m\u001b[4m0\u001b[24m731\n",
      "\u001b[90m45\u001b[39m member        14    \u001b[4m9\u001b[24m\u001b[4m3\u001b[24m673\n",
      "\u001b[90m46\u001b[39m member        15    \u001b[4m8\u001b[24m\u001b[4m4\u001b[24m414\n",
      "\u001b[90m47\u001b[39m member        16    \u001b[4m9\u001b[24m\u001b[4m7\u001b[24m163\n",
      "\u001b[90m48\u001b[39m member        17    \u001b[4m8\u001b[24m\u001b[4m6\u001b[24m881\n",
      "\u001b[90m49\u001b[39m member        18    \u001b[4m8\u001b[24m\u001b[4m2\u001b[24m325\n",
      "\u001b[90m50\u001b[39m member        19    \u001b[4m8\u001b[24m\u001b[4m9\u001b[24m481\n",
      "\u001b[90m51\u001b[39m member        20    \u001b[4m8\u001b[24m\u001b[4m8\u001b[24m763\n",
      "\u001b[90m52\u001b[39m member        21    \u001b[4m9\u001b[24m\u001b[4m5\u001b[24m284\n",
      "\u001b[90m53\u001b[39m member        22    \u001b[4m8\u001b[24m\u001b[4m7\u001b[24m222\n",
      "\u001b[90m54\u001b[39m member        23    \u001b[4m9\u001b[24m\u001b[4m2\u001b[24m712\n",
      "\u001b[90m55\u001b[39m member        24    \u001b[4m8\u001b[24m\u001b[4m3\u001b[24m805\n",
      "\u001b[90m56\u001b[39m member        25    \u001b[4m6\u001b[24m\u001b[4m7\u001b[24m736\n",
      "\u001b[90m57\u001b[39m member        26    \u001b[4m8\u001b[24m\u001b[4m2\u001b[24m718\n",
      "\u001b[90m58\u001b[39m member        27    \u001b[4m8\u001b[24m\u001b[4m2\u001b[24m368\n",
      "\u001b[90m59\u001b[39m member        28    \u001b[4m8\u001b[24m\u001b[4m5\u001b[24m234\n",
      "\u001b[90m60\u001b[39m member        29    \u001b[4m8\u001b[24m\u001b[4m5\u001b[24m707\n",
      "\u001b[90m61\u001b[39m member        30    \u001b[4m8\u001b[24m\u001b[4m1\u001b[24m078\n",
      "\u001b[90m62\u001b[39m member        31    \u001b[4m5\u001b[24m\u001b[4m2\u001b[24m461\n",
      "\u001b[90m# A tibble: 31 × 2\u001b[39m\n",
      "   day        n\n",
      "   \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m  \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m\n",
      "\u001b[90m 1\u001b[39m 01    \u001b[4m1\u001b[24m\u001b[4m4\u001b[24m\u001b[4m2\u001b[24m827\n",
      "\u001b[90m 2\u001b[39m 02    \u001b[4m1\u001b[24m\u001b[4m4\u001b[24m\u001b[4m5\u001b[24m116\n",
      "\u001b[90m 3\u001b[39m 03    \u001b[4m1\u001b[24m\u001b[4m4\u001b[24m\u001b[4m2\u001b[24m022\n",
      "\u001b[90m 4\u001b[39m 04    \u001b[4m1\u001b[24m\u001b[4m3\u001b[24m\u001b[4m8\u001b[24m209\n",
      "\u001b[90m 5\u001b[39m 05    \u001b[4m1\u001b[24m\u001b[4m4\u001b[24m\u001b[4m4\u001b[24m560\n",
      "\u001b[90m 6\u001b[39m 06    \u001b[4m1\u001b[24m\u001b[4m2\u001b[24m\u001b[4m7\u001b[24m409\n",
      "\u001b[90m 7\u001b[39m 07    \u001b[4m1\u001b[24m\u001b[4m3\u001b[24m\u001b[4m1\u001b[24m129\n",
      "\u001b[90m 8\u001b[39m 08    \u001b[4m1\u001b[24m\u001b[4m2\u001b[24m\u001b[4m5\u001b[24m526\n",
      "\u001b[90m 9\u001b[39m 09    \u001b[4m1\u001b[24m\u001b[4m6\u001b[24m\u001b[4m6\u001b[24m643\n",
      "\u001b[90m10\u001b[39m 10    \u001b[4m1\u001b[24m\u001b[4m6\u001b[24m\u001b[4m4\u001b[24m759\n",
      "\u001b[90m11\u001b[39m 11    \u001b[4m1\u001b[24m\u001b[4m3\u001b[24m\u001b[4m5\u001b[24m651\n",
      "\u001b[90m12\u001b[39m 12    \u001b[4m1\u001b[24m\u001b[4m4\u001b[24m\u001b[4m3\u001b[24m877\n",
      "\u001b[90m13\u001b[39m 13    \u001b[4m1\u001b[24m\u001b[4m5\u001b[24m\u001b[4m0\u001b[24m488\n",
      "\u001b[90m14\u001b[39m 14    \u001b[4m1\u001b[24m\u001b[4m5\u001b[24m\u001b[4m6\u001b[24m240\n",
      "\u001b[90m15\u001b[39m 15    \u001b[4m1\u001b[24m\u001b[4m3\u001b[24m\u001b[4m5\u001b[24m236\n",
      "\u001b[90m16\u001b[39m 16    \u001b[4m1\u001b[24m\u001b[4m6\u001b[24m\u001b[4m5\u001b[24m142\n",
      "\u001b[90m17\u001b[39m 17    \u001b[4m1\u001b[24m\u001b[4m4\u001b[24m\u001b[4m7\u001b[24m302\n",
      "\u001b[90m18\u001b[39m 18    \u001b[4m1\u001b[24m\u001b[4m3\u001b[24m\u001b[4m7\u001b[24m298\n",
      "\u001b[90m19\u001b[39m 19    \u001b[4m1\u001b[24m\u001b[4m4\u001b[24m\u001b[4m8\u001b[24m381\n",
      "\u001b[90m20\u001b[39m 20    \u001b[4m1\u001b[24m\u001b[4m4\u001b[24m\u001b[4m9\u001b[24m396\n",
      "\u001b[90m21\u001b[39m 21    \u001b[4m1\u001b[24m\u001b[4m5\u001b[24m\u001b[4m7\u001b[24m881\n",
      "\u001b[90m22\u001b[39m 22    \u001b[4m1\u001b[24m\u001b[4m4\u001b[24m\u001b[4m5\u001b[24m116\n",
      "\u001b[90m23\u001b[39m 23    \u001b[4m1\u001b[24m\u001b[4m6\u001b[24m\u001b[4m3\u001b[24m702\n",
      "\u001b[90m24\u001b[39m 24    \u001b[4m1\u001b[24m\u001b[4m4\u001b[24m\u001b[4m3\u001b[24m903\n",
      "\u001b[90m25\u001b[39m 25    \u001b[4m1\u001b[24m\u001b[4m1\u001b[24m\u001b[4m0\u001b[24m037\n",
      "\u001b[90m26\u001b[39m 26    \u001b[4m1\u001b[24m\u001b[4m3\u001b[24m\u001b[4m6\u001b[24m710\n",
      "\u001b[90m27\u001b[39m 27    \u001b[4m1\u001b[24m\u001b[4m3\u001b[24m\u001b[4m2\u001b[24m226\n",
      "\u001b[90m28\u001b[39m 28    \u001b[4m1\u001b[24m\u001b[4m4\u001b[24m\u001b[4m3\u001b[24m334\n",
      "\u001b[90m29\u001b[39m 29    \u001b[4m1\u001b[24m\u001b[4m4\u001b[24m\u001b[4m8\u001b[24m817\n",
      "\u001b[90m30\u001b[39m 30    \u001b[4m1\u001b[24m\u001b[4m4\u001b[24m\u001b[4m5\u001b[24m685\n",
      "\u001b[90m31\u001b[39m 31     \u001b[4m8\u001b[24m\u001b[4m5\u001b[24m521\n"
     ]
    }
   ],
   "source": [
    "#total rides by member type\n",
    "cyclistic_data %>%\n",
    "  group_by(member_casual) %>% \n",
    "  count(day) %>% \n",
    "  print(n = 62) #lets you view the entire tibble\n",
    "\n",
    "#total rides\n",
    "cyclistic_data %>%\n",
    "  count(day) %>% \n",
    "  print(n = 31) #lets you view the entire tibble"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ae82be78",
   "metadata": {
    "papermill": {
     "duration": 0.022046,
     "end_time": "2022-12-05T12:46:41.329207",
     "exception": false,
     "start_time": "2022-12-05T12:46:41.307161",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**#.......MONTH.......**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "id": "37bcc22e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T12:46:41.374441Z",
     "iopub.status.busy": "2022-12-05T12:46:41.372253Z",
     "iopub.status.idle": "2022-12-05T12:46:41.890148Z",
     "shell.execute_reply": "2022-12-05T12:46:41.887927Z"
    },
    "papermill": {
     "duration": 0.543048,
     "end_time": "2022-12-05T12:46:41.893048",
     "exception": false,
     "start_time": "2022-12-05T12:46:41.350000",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\u001b[90m# A tibble: 24 × 3\u001b[39m\n",
      "\u001b[90m# Groups:   member_casual [2]\u001b[39m\n",
      "   member_casual month      n\n",
      "   \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m         \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m  \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m\n",
      "\u001b[90m 1\u001b[39m casual        01     \u001b[4m1\u001b[24m\u001b[4m2\u001b[24m605\n",
      "\u001b[90m 2\u001b[39m casual        02     \u001b[4m1\u001b[24m\u001b[4m5\u001b[24m143\n",
      "\u001b[90m 3\u001b[39m casual        03     \u001b[4m6\u001b[24m\u001b[4m7\u001b[24m150\n",
      "\u001b[90m 4\u001b[39m casual        04     \u001b[4m9\u001b[24m\u001b[4m1\u001b[24m889\n",
      "\u001b[90m 5\u001b[39m casual        05    \u001b[4m2\u001b[24m\u001b[4m2\u001b[24m\u001b[4m0\u001b[24m232\n",
      "\u001b[90m 6\u001b[39m casual        06    \u001b[4m2\u001b[24m\u001b[4m9\u001b[24m\u001b[4m2\u001b[24m053\n",
      "\u001b[90m 7\u001b[39m casual        07    \u001b[4m3\u001b[24m\u001b[4m1\u001b[24m\u001b[4m1\u001b[24m649\n",
      "\u001b[90m 8\u001b[39m casual        08    \u001b[4m2\u001b[24m\u001b[4m7\u001b[24m\u001b[4m0\u001b[24m074\n",
      "\u001b[90m 9\u001b[39m casual        09    \u001b[4m2\u001b[24m\u001b[4m2\u001b[24m\u001b[4m0\u001b[24m905\n",
      "\u001b[90m10\u001b[39m casual        10    \u001b[4m1\u001b[24m\u001b[4m5\u001b[24m\u001b[4m1\u001b[24m312\n",
      "\u001b[90m11\u001b[39m casual        11     \u001b[4m6\u001b[24m\u001b[4m9\u001b[24m958\n",
      "\u001b[90m12\u001b[39m casual        12     \u001b[4m4\u001b[24m\u001b[4m5\u001b[24m076\n",
      "\u001b[90m13\u001b[39m member        01     \u001b[4m6\u001b[24m\u001b[4m7\u001b[24m523\n",
      "\u001b[90m14\u001b[39m member        02     \u001b[4m7\u001b[24m\u001b[4m4\u001b[24m031\n",
      "\u001b[90m15\u001b[39m member        03    \u001b[4m1\u001b[24m\u001b[4m4\u001b[24m\u001b[4m8\u001b[24m821\n",
      "\u001b[90m16\u001b[39m member        04    \u001b[4m1\u001b[24m\u001b[4m8\u001b[24m\u001b[4m0\u001b[24m657\n",
      "\u001b[90m17\u001b[39m member        05    \u001b[4m2\u001b[24m\u001b[4m8\u001b[24m\u001b[4m2\u001b[24m284\n",
      "\u001b[90m18\u001b[39m member        06    \u001b[4m3\u001b[24m\u001b[4m2\u001b[24m\u001b[4m8\u001b[24m258\n",
      "\u001b[90m19\u001b[39m member        07    \u001b[4m3\u001b[24m\u001b[4m3\u001b[24m\u001b[4m0\u001b[24m980\n",
      "\u001b[90m20\u001b[39m member        08    \u001b[4m3\u001b[24m\u001b[4m3\u001b[24m\u001b[4m5\u001b[24m201\n",
      "\u001b[90m21\u001b[39m member        09    \u001b[4m3\u001b[24m\u001b[4m1\u001b[24m\u001b[4m4\u001b[24m214\n",
      "\u001b[90m22\u001b[39m member        10    \u001b[4m2\u001b[24m\u001b[4m6\u001b[24m\u001b[4m2\u001b[24m926\n",
      "\u001b[90m23\u001b[39m member        11    \u001b[4m1\u001b[24m\u001b[4m8\u001b[24m\u001b[4m5\u001b[24m909\n",
      "\u001b[90m24\u001b[39m member        12    \u001b[4m1\u001b[24m\u001b[4m3\u001b[24m\u001b[4m1\u001b[24m293\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 12 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>month</th><th scope=col>n</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>01</td><td> 80128</td></tr>\n",
       "\t<tr><td>02</td><td> 89174</td></tr>\n",
       "\t<tr><td>03</td><td>215971</td></tr>\n",
       "\t<tr><td>04</td><td>272546</td></tr>\n",
       "\t<tr><td>05</td><td>502516</td></tr>\n",
       "\t<tr><td>06</td><td>620311</td></tr>\n",
       "\t<tr><td>07</td><td>642629</td></tr>\n",
       "\t<tr><td>08</td><td>605275</td></tr>\n",
       "\t<tr><td>09</td><td>535119</td></tr>\n",
       "\t<tr><td>10</td><td>414238</td></tr>\n",
       "\t<tr><td>11</td><td>255867</td></tr>\n",
       "\t<tr><td>12</td><td>176369</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 12 × 2\n",
       "\\begin{tabular}{ll}\n",
       " month & n\\\\\n",
       " <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t 01 &  80128\\\\\n",
       "\t 02 &  89174\\\\\n",
       "\t 03 & 215971\\\\\n",
       "\t 04 & 272546\\\\\n",
       "\t 05 & 502516\\\\\n",
       "\t 06 & 620311\\\\\n",
       "\t 07 & 642629\\\\\n",
       "\t 08 & 605275\\\\\n",
       "\t 09 & 535119\\\\\n",
       "\t 10 & 414238\\\\\n",
       "\t 11 & 255867\\\\\n",
       "\t 12 & 176369\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 12 × 2\n",
       "\n",
       "| month &lt;chr&gt; | n &lt;int&gt; |\n",
       "|---|---|\n",
       "| 01 |  80128 |\n",
       "| 02 |  89174 |\n",
       "| 03 | 215971 |\n",
       "| 04 | 272546 |\n",
       "| 05 | 502516 |\n",
       "| 06 | 620311 |\n",
       "| 07 | 642629 |\n",
       "| 08 | 605275 |\n",
       "| 09 | 535119 |\n",
       "| 10 | 414238 |\n",
       "| 11 | 255867 |\n",
       "| 12 | 176369 |\n",
       "\n"
      ],
      "text/plain": [
       "   month n     \n",
       "1  01     80128\n",
       "2  02     89174\n",
       "3  03    215971\n",
       "4  04    272546\n",
       "5  05    502516\n",
       "6  06    620311\n",
       "7  07    642629\n",
       "8  08    605275\n",
       "9  09    535119\n",
       "10 10    414238\n",
       "11 11    255867\n",
       "12 12    176369"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#total rides by member type \n",
    "cyclistic_data %>%\n",
    "  group_by(member_casual) %>% \n",
    "  count(month) %>% \n",
    "  print(n = 24) #lets you view the entire tibble\n",
    "\n",
    "#total rides\n",
    "cyclistic_data %>%\n",
    "  count(month) "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2b7a46f4",
   "metadata": {
    "papermill": {
     "duration": 0.020796,
     "end_time": "2022-12-05T12:46:41.935258",
     "exception": false,
     "start_time": "2022-12-05T12:46:41.914462",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**#....SEASON.......**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "id": "a24b028b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T12:46:41.978946Z",
     "iopub.status.busy": "2022-12-05T12:46:41.976873Z",
     "iopub.status.idle": "2022-12-05T12:46:47.441390Z",
     "shell.execute_reply": "2022-12-05T12:46:47.438782Z"
    },
    "papermill": {
     "duration": 5.489918,
     "end_time": "2022-12-05T12:46:47.445222",
     "exception": false,
     "start_time": "2022-12-05T12:46:41.955304",
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
       "\t<tr><th scope=col>member_casual</th><th scope=col>season</th><th scope=col>n</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Spring</td><td>379271</td></tr>\n",
       "\t<tr><td>member</td><td>Spring</td><td>611762</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 2 × 3\n",
       "\\begin{tabular}{lll}\n",
       " member\\_casual & season & n\\\\\n",
       " <chr> & <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t casual & Spring & 379271\\\\\n",
       "\t member & Spring & 611762\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 2 × 3\n",
       "\n",
       "| member_casual &lt;chr&gt; | season &lt;chr&gt; | n &lt;int&gt; |\n",
       "|---|---|---|\n",
       "| casual | Spring | 379271 |\n",
       "| member | Spring | 611762 |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual season n     \n",
       "1 casual        Spring 379271\n",
       "2 member        Spring 611762"
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
       "\t<tr><th scope=col>season</th><th scope=col>n</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Spring</td><td>991033</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 1 × 2\n",
       "\\begin{tabular}{ll}\n",
       " season & n\\\\\n",
       " <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t Spring & 991033\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 1 × 2\n",
       "\n",
       "| season &lt;chr&gt; | n &lt;int&gt; |\n",
       "|---|---|\n",
       "| Spring | 991033 |\n",
       "\n"
      ],
      "text/plain": [
       "  season n     \n",
       "1 Spring 991033"
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
       "\t<tr><th scope=col>member_casual</th><th scope=col>season</th><th scope=col>n</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Summer</td><td>873776</td></tr>\n",
       "\t<tr><td>member</td><td>Summer</td><td>994439</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 2 × 3\n",
       "\\begin{tabular}{lll}\n",
       " member\\_casual & season & n\\\\\n",
       " <chr> & <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t casual & Summer & 873776\\\\\n",
       "\t member & Summer & 994439\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 2 × 3\n",
       "\n",
       "| member_casual &lt;chr&gt; | season &lt;chr&gt; | n &lt;int&gt; |\n",
       "|---|---|---|\n",
       "| casual | Summer | 873776 |\n",
       "| member | Summer | 994439 |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual season n     \n",
       "1 casual        Summer 873776\n",
       "2 member        Summer 994439"
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
       "\t<tr><th scope=col>season</th><th scope=col>n</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Summer</td><td>1868215</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 1 × 2\n",
       "\\begin{tabular}{ll}\n",
       " season & n\\\\\n",
       " <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t Summer & 1868215\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 1 × 2\n",
       "\n",
       "| season &lt;chr&gt; | n &lt;int&gt; |\n",
       "|---|---|\n",
       "| Summer | 1868215 |\n",
       "\n"
      ],
      "text/plain": [
       "  season n      \n",
       "1 Summer 1868215"
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
       "\t<tr><th scope=col>member_casual</th><th scope=col>season</th><th scope=col>n</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Fall</td><td>442175</td></tr>\n",
       "\t<tr><td>member</td><td>Fall</td><td>763049</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 2 × 3\n",
       "\\begin{tabular}{lll}\n",
       " member\\_casual & season & n\\\\\n",
       " <chr> & <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t casual & Fall & 442175\\\\\n",
       "\t member & Fall & 763049\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 2 × 3\n",
       "\n",
       "| member_casual &lt;chr&gt; | season &lt;chr&gt; | n &lt;int&gt; |\n",
       "|---|---|---|\n",
       "| casual | Fall | 442175 |\n",
       "| member | Fall | 763049 |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual season n     \n",
       "1 casual        Fall   442175\n",
       "2 member        Fall   763049"
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
       "\t<tr><th scope=col>season</th><th scope=col>n</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Fall</td><td>1205224</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 1 × 2\n",
       "\\begin{tabular}{ll}\n",
       " season & n\\\\\n",
       " <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t Fall & 1205224\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 1 × 2\n",
       "\n",
       "| season &lt;chr&gt; | n &lt;int&gt; |\n",
       "|---|---|\n",
       "| Fall | 1205224 |\n",
       "\n"
      ],
      "text/plain": [
       "  season n      \n",
       "1 Fall   1205224"
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
       "\t<tr><th scope=col>member_casual</th><th scope=col>season</th><th scope=col>n</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Winter</td><td> 72824</td></tr>\n",
       "\t<tr><td>member</td><td>Winter</td><td>272847</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 2 × 3\n",
       "\\begin{tabular}{lll}\n",
       " member\\_casual & season & n\\\\\n",
       " <chr> & <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t casual & Winter &  72824\\\\\n",
       "\t member & Winter & 272847\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 2 × 3\n",
       "\n",
       "| member_casual &lt;chr&gt; | season &lt;chr&gt; | n &lt;int&gt; |\n",
       "|---|---|---|\n",
       "| casual | Winter |  72824 |\n",
       "| member | Winter | 272847 |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual season n     \n",
       "1 casual        Winter  72824\n",
       "2 member        Winter 272847"
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
       "\t<tr><th scope=col>season</th><th scope=col>n</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Winter</td><td>345671</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 1 × 2\n",
       "\\begin{tabular}{ll}\n",
       " season & n\\\\\n",
       " <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t Winter & 345671\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 1 × 2\n",
       "\n",
       "| season &lt;chr&gt; | n &lt;int&gt; |\n",
       "|---|---|\n",
       "| Winter | 345671 |\n",
       "\n"
      ],
      "text/plain": [
       "  season n     \n",
       "1 Winter 345671"
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
       "\t<tr><th scope=col>season</th><th scope=col>member_casual</th><th scope=col>n</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Fall  </td><td>casual</td><td>442175</td></tr>\n",
       "\t<tr><td>Fall  </td><td>member</td><td>763049</td></tr>\n",
       "\t<tr><td>Spring</td><td>casual</td><td>379271</td></tr>\n",
       "\t<tr><td>Spring</td><td>member</td><td>611762</td></tr>\n",
       "\t<tr><td>Summer</td><td>casual</td><td>873776</td></tr>\n",
       "\t<tr><td>Summer</td><td>member</td><td>994439</td></tr>\n",
       "\t<tr><td>Winter</td><td>casual</td><td> 72824</td></tr>\n",
       "\t<tr><td>Winter</td><td>member</td><td>272847</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 8 × 3\n",
       "\\begin{tabular}{lll}\n",
       " season & member\\_casual & n\\\\\n",
       " <chr> & <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t Fall   & casual & 442175\\\\\n",
       "\t Fall   & member & 763049\\\\\n",
       "\t Spring & casual & 379271\\\\\n",
       "\t Spring & member & 611762\\\\\n",
       "\t Summer & casual & 873776\\\\\n",
       "\t Summer & member & 994439\\\\\n",
       "\t Winter & casual &  72824\\\\\n",
       "\t Winter & member & 272847\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 8 × 3\n",
       "\n",
       "| season &lt;chr&gt; | member_casual &lt;chr&gt; | n &lt;int&gt; |\n",
       "|---|---|---|\n",
       "| Fall   | casual | 442175 |\n",
       "| Fall   | member | 763049 |\n",
       "| Spring | casual | 379271 |\n",
       "| Spring | member | 611762 |\n",
       "| Summer | casual | 873776 |\n",
       "| Summer | member | 994439 |\n",
       "| Winter | casual |  72824 |\n",
       "| Winter | member | 272847 |\n",
       "\n"
      ],
      "text/plain": [
       "  season member_casual n     \n",
       "1 Fall   casual        442175\n",
       "2 Fall   member        763049\n",
       "3 Spring casual        379271\n",
       "4 Spring member        611762\n",
       "5 Summer casual        873776\n",
       "6 Summer member        994439\n",
       "7 Winter casual         72824\n",
       "8 Winter member        272847"
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
       "\t<tr><th scope=col>season</th><th scope=col>n</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Fall  </td><td>1205224</td></tr>\n",
       "\t<tr><td>Spring</td><td> 991033</td></tr>\n",
       "\t<tr><td>Summer</td><td>1868215</td></tr>\n",
       "\t<tr><td>Winter</td><td> 345671</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 4 × 2\n",
       "\\begin{tabular}{ll}\n",
       " season & n\\\\\n",
       " <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t Fall   & 1205224\\\\\n",
       "\t Spring &  991033\\\\\n",
       "\t Summer & 1868215\\\\\n",
       "\t Winter &  345671\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 4 × 2\n",
       "\n",
       "| season &lt;chr&gt; | n &lt;int&gt; |\n",
       "|---|---|\n",
       "| Fall   | 1205224 |\n",
       "| Spring |  991033 |\n",
       "| Summer | 1868215 |\n",
       "| Winter |  345671 |\n",
       "\n"
      ],
      "text/plain": [
       "  season n      \n",
       "1 Fall   1205224\n",
       "2 Spring  991033\n",
       "3 Summer 1868215\n",
       "4 Winter  345671"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#-----spring-------\n",
    "\n",
    "#total rides by member type \n",
    "cyclistic_data %>%\n",
    "  group_by(member_casual) %>% \n",
    "  filter(season == \"Spring\") %>% \n",
    "  count(season)\n",
    "\n",
    "#total rides\n",
    "cyclistic_data %>%\n",
    "  filter(season == \"Spring\") %>% \n",
    "  count(season)\n",
    "\n",
    "#-----summer-------\n",
    "\n",
    "#total rides by member type\n",
    "cyclistic_data %>%\n",
    "  group_by(member_casual) %>% \n",
    "  filter(season == \"Summer\") %>% \n",
    "  count(season)\n",
    "\n",
    "#total rides\n",
    "cyclistic_data %>%\n",
    "  filter(season == \"Summer\") %>% \n",
    "  count(season)\n",
    "\n",
    "#-----fall-------\n",
    "\n",
    "#total rides by member type\n",
    "cyclistic_data %>%\n",
    "  group_by(member_casual) %>% \n",
    "  filter(season == \"Fall\") %>% \n",
    "  count(season)\n",
    "\n",
    "#total rides\n",
    "cyclistic_data %>%\n",
    "  filter(season == \"Fall\") %>% \n",
    "  count(season)\n",
    "\n",
    "#-----winter-------\n",
    "\n",
    "#total rides by member type\n",
    "cyclistic_data %>%\n",
    "  group_by(member_casual) %>% \n",
    "  filter(season == \"Winter\") %>% \n",
    "  count(season)\n",
    "\n",
    "#total rides \n",
    "cyclistic_data %>%\n",
    "  filter(season == \"Winter\") %>% \n",
    "  count(season)\n",
    "\n",
    "#-----all seasons-------\n",
    "\n",
    "#total rides by member type\n",
    "cyclistic_data %>%\n",
    "  group_by(season, member_casual) %>% \n",
    "  count(season)\n",
    "\n",
    "#total rides\n",
    "cyclistic_data %>%\n",
    "  group_by(season) %>% \n",
    "  count(season)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b3220558",
   "metadata": {
    "papermill": {
     "duration": 0.020906,
     "end_time": "2022-12-05T12:46:47.486866",
     "exception": false,
     "start_time": "2022-12-05T12:46:47.465960",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**#......AVERAGE RIDE LENGTH....**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 23,
   "id": "7753e1b0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T12:46:47.532542Z",
     "iopub.status.busy": "2022-12-05T12:46:47.530706Z",
     "iopub.status.idle": "2022-12-05T12:46:47.789471Z",
     "shell.execute_reply": "2022-12-05T12:46:47.786531Z"
    },
    "papermill": {
     "duration": 0.285399,
     "end_time": "2022-12-05T12:46:47.792876",
     "exception": false,
     "start_time": "2022-12-05T12:46:47.507477",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Time difference of 17.24344 mins\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>time</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>24.40004 mins</td></tr>\n",
       "\t<tr><td>member</td><td>12.45438 mins</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " member\\_casual & time\\\\\n",
       " <chr> & <drtn>\\\\\n",
       "\\hline\n",
       "\t casual & 24.40004 mins\\\\\n",
       "\t member & 12.45438 mins\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 2 × 2\n",
       "\n",
       "| member_casual &lt;chr&gt; | time &lt;drtn&gt; |\n",
       "|---|---|\n",
       "| casual | 24.40004 mins |\n",
       "| member | 12.45438 mins |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual time         \n",
       "1 casual        24.40004 mins\n",
       "2 member        12.45438 mins"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#average of ride_length\n",
    "cyclistic_avgRide <- mean(cyclistic_data$ride_length)\n",
    "print(cyclistic_avgRide)\n",
    "\n",
    "#------------------MEMBER TYPE--------------------\n",
    "\n",
    "#average ride_length\n",
    "cyclistic_data %>% group_by( member_casual) %>% \n",
    "  summarise_at(vars(ride_length),\n",
    "               list(time = mean))\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "cfaba9a1",
   "metadata": {
    "papermill": {
     "duration": 0.022145,
     "end_time": "2022-12-05T12:46:47.836340",
     "exception": false,
     "start_time": "2022-12-05T12:46:47.814195",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**#......TYPE OF BIKE.....**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 24,
   "id": "1f7306be",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T12:46:47.884122Z",
     "iopub.status.busy": "2022-12-05T12:46:47.882075Z",
     "iopub.status.idle": "2022-12-05T12:46:49.064450Z",
     "shell.execute_reply": "2022-12-05T12:46:49.061870Z"
    },
    "papermill": {
     "duration": 1.209721,
     "end_time": "2022-12-05T12:46:49.067905",
     "exception": false,
     "start_time": "2022-12-05T12:46:47.858184",
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
       "\t<tr><th scope=col>member_casual</th><th scope=col>rideable_type</th><th scope=col>time</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>classic_bike </td><td>24.57787 mins</td></tr>\n",
       "\t<tr><td>casual</td><td>docked_bike  </td><td>52.47900 mins</td></tr>\n",
       "\t<tr><td>casual</td><td>electric_bike</td><td>16.90167 mins</td></tr>\n",
       "\t<tr><td>member</td><td>classic_bike </td><td>13.20802 mins</td></tr>\n",
       "\t<tr><td>member</td><td>electric_bike</td><td>11.00341 mins</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 5 × 3\n",
       "\\begin{tabular}{lll}\n",
       " member\\_casual & rideable\\_type & time\\\\\n",
       " <chr> & <chr> & <drtn>\\\\\n",
       "\\hline\n",
       "\t casual & classic\\_bike  & 24.57787 mins\\\\\n",
       "\t casual & docked\\_bike   & 52.47900 mins\\\\\n",
       "\t casual & electric\\_bike & 16.90167 mins\\\\\n",
       "\t member & classic\\_bike  & 13.20802 mins\\\\\n",
       "\t member & electric\\_bike & 11.00341 mins\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 5 × 3\n",
       "\n",
       "| member_casual &lt;chr&gt; | rideable_type &lt;chr&gt; | time &lt;drtn&gt; |\n",
       "|---|---|---|\n",
       "| casual | classic_bike  | 24.57787 mins |\n",
       "| casual | docked_bike   | 52.47900 mins |\n",
       "| casual | electric_bike | 16.90167 mins |\n",
       "| member | classic_bike  | 13.20802 mins |\n",
       "| member | electric_bike | 11.00341 mins |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual rideable_type time         \n",
       "1 casual        classic_bike  24.57787 mins\n",
       "2 casual        docked_bike   52.47900 mins\n",
       "3 casual        electric_bike 16.90167 mins\n",
       "4 member        classic_bike  13.20802 mins\n",
       "5 member        electric_bike 11.00341 mins"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 3 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>rideable_type</th><th scope=col>time</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>classic_bike </td><td>17.07028 mins</td></tr>\n",
       "\t<tr><td>docked_bike  </td><td>52.47900 mins</td></tr>\n",
       "\t<tr><td>electric_bike</td><td>13.56596 mins</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 3 × 2\n",
       "\\begin{tabular}{ll}\n",
       " rideable\\_type & time\\\\\n",
       " <chr> & <drtn>\\\\\n",
       "\\hline\n",
       "\t classic\\_bike  & 17.07028 mins\\\\\n",
       "\t docked\\_bike   & 52.47900 mins\\\\\n",
       "\t electric\\_bike & 13.56596 mins\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 3 × 2\n",
       "\n",
       "| rideable_type &lt;chr&gt; | time &lt;drtn&gt; |\n",
       "|---|---|\n",
       "| classic_bike  | 17.07028 mins |\n",
       "| docked_bike   | 52.47900 mins |\n",
       "| electric_bike | 13.56596 mins |\n",
       "\n"
      ],
      "text/plain": [
       "  rideable_type time         \n",
       "1 classic_bike  17.07028 mins\n",
       "2 docked_bike   52.47900 mins\n",
       "3 electric_bike 13.56596 mins"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#total rides by member type \n",
    "cyclistic_data %>% group_by(member_casual, rideable_type) %>% \n",
    "  summarise_at(vars(ride_length),\n",
    "               list(time = mean))\n",
    "\n",
    "#average ride_length\n",
    "cyclistic_data %>% group_by(rideable_type) %>% \n",
    "  summarise_at(vars(ride_length),\n",
    "               list(time = mean))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "63002e2e",
   "metadata": {
    "papermill": {
     "duration": 0.021065,
     "end_time": "2022-12-05T12:46:49.110155",
     "exception": false,
     "start_time": "2022-12-05T12:46:49.089090",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**#......HOUR.......**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 25,
   "id": "f5a1acb1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T12:46:49.156319Z",
     "iopub.status.busy": "2022-12-05T12:46:49.154727Z",
     "iopub.status.idle": "2022-12-05T12:46:49.734013Z",
     "shell.execute_reply": "2022-12-05T12:46:49.730136Z"
    },
    "papermill": {
     "duration": 0.606912,
     "end_time": "2022-12-05T12:46:49.738410",
     "exception": false,
     "start_time": "2022-12-05T12:46:49.131498",
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
      "\u001b[90m# Groups:   hour [24]\u001b[39m\n",
      "    hour member_casual time         \n",
      "   \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m         \u001b[3m\u001b[90m<drtn>\u001b[39m\u001b[23m       \n",
      "\u001b[90m 1\u001b[39m     0 casual        21.31922 mins\n",
      "\u001b[90m 2\u001b[39m     0 member        12.38668 mins\n",
      "\u001b[90m 3\u001b[39m     1 casual        24.21573 mins\n",
      "\u001b[90m 4\u001b[39m     1 member        12.47635 mins\n",
      "\u001b[90m 5\u001b[39m     2 casual        23.82308 mins\n",
      "\u001b[90m 6\u001b[39m     2 member        12.40059 mins\n",
      "\u001b[90m 7\u001b[39m     3 casual        25.96098 mins\n",
      "\u001b[90m 8\u001b[39m     3 member        12.29272 mins\n",
      "\u001b[90m 9\u001b[39m     4 casual        19.84382 mins\n",
      "\u001b[90m10\u001b[39m     4 member        12.30080 mins\n",
      "\u001b[90m11\u001b[39m     5 casual        17.39377 mins\n",
      "\u001b[90m12\u001b[39m     5 member        10.40710 mins\n",
      "\u001b[90m13\u001b[39m     6 casual        17.59924 mins\n",
      "\u001b[90m14\u001b[39m     6 member        10.85850 mins\n",
      "\u001b[90m15\u001b[39m     7 casual        15.66691 mins\n",
      "\u001b[90m16\u001b[39m     7 member        11.39230 mins\n",
      "\u001b[90m17\u001b[39m     8 casual        19.04148 mins\n",
      "\u001b[90m18\u001b[39m     8 member        11.19262 mins\n",
      "\u001b[90m19\u001b[39m     9 casual        24.02417 mins\n",
      "\u001b[90m20\u001b[39m     9 member        11.48474 mins\n",
      "\u001b[90m21\u001b[39m    10 casual        28.86692 mins\n",
      "\u001b[90m22\u001b[39m    10 member        12.25480 mins\n",
      "\u001b[90m23\u001b[39m    11 casual        28.85012 mins\n",
      "\u001b[90m24\u001b[39m    11 member        12.57116 mins\n",
      "\u001b[90m25\u001b[39m    12 casual        28.15565 mins\n",
      "\u001b[90m26\u001b[39m    12 member        12.25933 mins\n",
      "\u001b[90m27\u001b[39m    13 casual        28.33351 mins\n",
      "\u001b[90m28\u001b[39m    13 member        12.52282 mins\n",
      "\u001b[90m29\u001b[39m    14 casual        28.09630 mins\n",
      "\u001b[90m30\u001b[39m    14 member        12.85344 mins\n",
      "\u001b[90m31\u001b[39m    15 casual        26.95824 mins\n",
      "\u001b[90m32\u001b[39m    15 member        12.79277 mins\n",
      "\u001b[90m33\u001b[39m    16 casual        24.68784 mins\n",
      "\u001b[90m34\u001b[39m    16 member        12.92645 mins\n",
      "\u001b[90m35\u001b[39m    17 casual        22.58414 mins\n",
      "\u001b[90m36\u001b[39m    17 member        13.18697 mins\n",
      "\u001b[90m37\u001b[39m    18 casual        22.54306 mins\n",
      "\u001b[90m38\u001b[39m    18 member        13.13336 mins\n",
      "\u001b[90m39\u001b[39m    19 casual        22.94561 mins\n",
      "\u001b[90m40\u001b[39m    19 member        12.93945 mins\n",
      "\u001b[90m41\u001b[39m    20 casual        22.31733 mins\n",
      "\u001b[90m42\u001b[39m    20 member        12.70626 mins\n",
      "\u001b[90m43\u001b[39m    21 casual        21.01279 mins\n",
      "\u001b[90m44\u001b[39m    21 member        12.37145 mins\n",
      "\u001b[90m45\u001b[39m    22 casual        20.70226 mins\n",
      "\u001b[90m46\u001b[39m    22 member        12.36919 mins\n",
      "\u001b[90m47\u001b[39m    23 casual        21.57362 mins\n",
      "\u001b[90m48\u001b[39m    23 member        12.47860 mins\n",
      "\u001b[90m# A tibble: 24 × 2\u001b[39m\n",
      "    hour time         \n",
      "   \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m \u001b[3m\u001b[90m<drtn>\u001b[39m\u001b[23m       \n",
      "\u001b[90m 1\u001b[39m     0 17.46487 mins\n",
      "\u001b[90m 2\u001b[39m     1 19.26173 mins\n",
      "\u001b[90m 3\u001b[39m     2 19.25982 mins\n",
      "\u001b[90m 4\u001b[39m     3 20.25895 mins\n",
      "\u001b[90m 5\u001b[39m     4 15.58016 mins\n",
      "\u001b[90m 6\u001b[39m     5 12.08207 mins\n",
      "\u001b[90m 7\u001b[39m     6 12.32587 mins\n",
      "\u001b[90m 8\u001b[39m     7 12.27333 mins\n",
      "\u001b[90m 9\u001b[39m     8 13.02473 mins\n",
      "\u001b[90m10\u001b[39m     9 15.55466 mins\n",
      "\u001b[90m11\u001b[39m    10 19.02519 mins\n",
      "\u001b[90m12\u001b[39m    11 19.55851 mins\n",
      "\u001b[90m13\u001b[39m    12 19.18183 mins\n",
      "\u001b[90m14\u001b[39m    13 19.61896 mins\n",
      "\u001b[90m15\u001b[39m    14 19.91642 mins\n",
      "\u001b[90m16\u001b[39m    15 19.01131 mins\n",
      "\u001b[90m17\u001b[39m    16 17.55905 mins\n",
      "\u001b[90m18\u001b[39m    17 16.71158 mins\n",
      "\u001b[90m19\u001b[39m    18 16.89869 mins\n",
      "\u001b[90m20\u001b[39m    19 17.11077 mins\n",
      "\u001b[90m21\u001b[39m    20 16.81796 mins\n",
      "\u001b[90m22\u001b[39m    21 16.30122 mins\n",
      "\u001b[90m23\u001b[39m    22 16.52856 mins\n",
      "\u001b[90m24\u001b[39m    23 17.34526 mins\n"
     ]
    }
   ],
   "source": [
    "#average ride_length by member type\n",
    "cyclistic_data %>% group_by(hour, member_casual) %>% \n",
    "  summarise_at(vars(ride_length),\n",
    "               list(time = mean)) %>% \n",
    "  print(n=48) #lets you view entire tibble\n",
    "\n",
    "#average ride_length\n",
    "cyclistic_data %>% group_by(hour) %>% \n",
    "  summarise_at(vars(ride_length),\n",
    "               list(time = mean)) %>% \n",
    "  print(n=24) #lets you view entire tibble"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "34c5c1b8",
   "metadata": {
    "papermill": {
     "duration": 0.021822,
     "end_time": "2022-12-05T12:46:49.782381",
     "exception": false,
     "start_time": "2022-12-05T12:46:49.760559",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**#......TIME OF THE DAY....**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 26,
   "id": "ae816b78",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T12:46:49.830530Z",
     "iopub.status.busy": "2022-12-05T12:46:49.828640Z",
     "iopub.status.idle": "2022-12-05T12:46:56.390047Z",
     "shell.execute_reply": "2022-12-05T12:46:56.387861Z"
    },
    "papermill": {
     "duration": 6.588466,
     "end_time": "2022-12-05T12:46:56.392630",
     "exception": false,
     "start_time": "2022-12-05T12:46:49.804164",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>time</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>24.35431 mins</td></tr>\n",
       "\t<tr><td>member</td><td>11.63362 mins</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " member\\_casual & time\\\\\n",
       " <chr> & <drtn>\\\\\n",
       "\\hline\n",
       "\t casual & 24.35431 mins\\\\\n",
       "\t member & 11.63362 mins\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 2 × 2\n",
       "\n",
       "| member_casual &lt;chr&gt; | time &lt;drtn&gt; |\n",
       "|---|---|\n",
       "| casual | 24.35431 mins |\n",
       "| member | 11.63362 mins |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual time         \n",
       "1 casual        24.35431 mins\n",
       "2 member        11.63362 mins"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 1 × 1</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>time</th></tr>\n",
       "\t<tr><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>15.59833 mins</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 1 × 1\n",
       "\\begin{tabular}{l}\n",
       " time\\\\\n",
       " <drtn>\\\\\n",
       "\\hline\n",
       "\t 15.59833 mins\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 1 × 1\n",
       "\n",
       "| time &lt;drtn&gt; |\n",
       "|---|\n",
       "| 15.59833 mins |\n",
       "\n"
      ],
      "text/plain": [
       "  time         \n",
       "1 15.59833 mins"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>time</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>26.15896 mins</td></tr>\n",
       "\t<tr><td>member</td><td>12.82334 mins</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " member\\_casual & time\\\\\n",
       " <chr> & <drtn>\\\\\n",
       "\\hline\n",
       "\t casual & 26.15896 mins\\\\\n",
       "\t member & 12.82334 mins\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 2 × 2\n",
       "\n",
       "| member_casual &lt;chr&gt; | time &lt;drtn&gt; |\n",
       "|---|---|\n",
       "| casual | 26.15896 mins |\n",
       "| member | 12.82334 mins |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual time         \n",
       "1 casual        26.15896 mins\n",
       "2 member        12.82334 mins"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 1 × 1</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>time</th></tr>\n",
       "\t<tr><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>18.41503 mins</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 1 × 1\n",
       "\\begin{tabular}{l}\n",
       " time\\\\\n",
       " <drtn>\\\\\n",
       "\\hline\n",
       "\t 18.41503 mins\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 1 × 1\n",
       "\n",
       "| time &lt;drtn&gt; |\n",
       "|---|\n",
       "| 18.41503 mins |\n",
       "\n"
      ],
      "text/plain": [
       "  time         \n",
       "1 18.41503 mins"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>time</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>22.08110 mins</td></tr>\n",
       "\t<tr><td>member</td><td>12.81414 mins</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " member\\_casual & time\\\\\n",
       " <chr> & <drtn>\\\\\n",
       "\\hline\n",
       "\t casual & 22.08110 mins\\\\\n",
       "\t member & 12.81414 mins\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 2 × 2\n",
       "\n",
       "| member_casual &lt;chr&gt; | time &lt;drtn&gt; |\n",
       "|---|---|\n",
       "| casual | 22.08110 mins |\n",
       "| member | 12.81414 mins |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual time         \n",
       "1 casual        22.08110 mins\n",
       "2 member        12.81414 mins"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 1 × 1</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>time</th></tr>\n",
       "\t<tr><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>16.85004 mins</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 1 × 1\n",
       "\\begin{tabular}{l}\n",
       " time\\\\\n",
       " <drtn>\\\\\n",
       "\\hline\n",
       "\t 16.85004 mins\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 1 × 1\n",
       "\n",
       "| time &lt;drtn&gt; |\n",
       "|---|\n",
       "| 16.85004 mins |\n",
       "\n"
      ],
      "text/plain": [
       "  time         \n",
       "1 16.85004 mins"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>time</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>22.31371 mins</td></tr>\n",
       "\t<tr><td>member</td><td>11.78451 mins</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " member\\_casual & time\\\\\n",
       " <chr> & <drtn>\\\\\n",
       "\\hline\n",
       "\t casual & 22.31371 mins\\\\\n",
       "\t member & 11.78451 mins\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 2 × 2\n",
       "\n",
       "| member_casual &lt;chr&gt; | time &lt;drtn&gt; |\n",
       "|---|---|\n",
       "| casual | 22.31371 mins |\n",
       "| member | 11.78451 mins |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual time         \n",
       "1 casual        22.31371 mins\n",
       "2 member        11.78451 mins"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 1 × 1</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>time</th></tr>\n",
       "\t<tr><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>17.05856 mins</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 1 × 1\n",
       "\\begin{tabular}{l}\n",
       " time\\\\\n",
       " <drtn>\\\\\n",
       "\\hline\n",
       "\t 17.05856 mins\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 1 × 1\n",
       "\n",
       "| time &lt;drtn&gt; |\n",
       "|---|\n",
       "| 17.05856 mins |\n",
       "\n"
      ],
      "text/plain": [
       "  time         \n",
       "1 17.05856 mins"
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
       "\t<tr><th scope=col>time_of_day</th><th scope=col>member_casual</th><th scope=col>time</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Afternoon</td><td>casual</td><td>26.15896 mins</td></tr>\n",
       "\t<tr><td>Afternoon</td><td>member</td><td>12.82334 mins</td></tr>\n",
       "\t<tr><td>Evening  </td><td>casual</td><td>22.08110 mins</td></tr>\n",
       "\t<tr><td>Evening  </td><td>member</td><td>12.81414 mins</td></tr>\n",
       "\t<tr><td>Morning  </td><td>casual</td><td>24.35431 mins</td></tr>\n",
       "\t<tr><td>Morning  </td><td>member</td><td>11.63362 mins</td></tr>\n",
       "\t<tr><td>Night    </td><td>casual</td><td>22.31371 mins</td></tr>\n",
       "\t<tr><td>Night    </td><td>member</td><td>11.78451 mins</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 8 × 3\n",
       "\\begin{tabular}{lll}\n",
       " time\\_of\\_day & member\\_casual & time\\\\\n",
       " <chr> & <chr> & <drtn>\\\\\n",
       "\\hline\n",
       "\t Afternoon & casual & 26.15896 mins\\\\\n",
       "\t Afternoon & member & 12.82334 mins\\\\\n",
       "\t Evening   & casual & 22.08110 mins\\\\\n",
       "\t Evening   & member & 12.81414 mins\\\\\n",
       "\t Morning   & casual & 24.35431 mins\\\\\n",
       "\t Morning   & member & 11.63362 mins\\\\\n",
       "\t Night     & casual & 22.31371 mins\\\\\n",
       "\t Night     & member & 11.78451 mins\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 8 × 3\n",
       "\n",
       "| time_of_day &lt;chr&gt; | member_casual &lt;chr&gt; | time &lt;drtn&gt; |\n",
       "|---|---|---|\n",
       "| Afternoon | casual | 26.15896 mins |\n",
       "| Afternoon | member | 12.82334 mins |\n",
       "| Evening   | casual | 22.08110 mins |\n",
       "| Evening   | member | 12.81414 mins |\n",
       "| Morning   | casual | 24.35431 mins |\n",
       "| Morning   | member | 11.63362 mins |\n",
       "| Night     | casual | 22.31371 mins |\n",
       "| Night     | member | 11.78451 mins |\n",
       "\n"
      ],
      "text/plain": [
       "  time_of_day member_casual time         \n",
       "1 Afternoon   casual        26.15896 mins\n",
       "2 Afternoon   member        12.82334 mins\n",
       "3 Evening     casual        22.08110 mins\n",
       "4 Evening     member        12.81414 mins\n",
       "5 Morning     casual        24.35431 mins\n",
       "6 Morning     member        11.63362 mins\n",
       "7 Night       casual        22.31371 mins\n",
       "8 Night       member        11.78451 mins"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 4 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>time_of_day</th><th scope=col>time</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Afternoon</td><td>18.41503 mins</td></tr>\n",
       "\t<tr><td>Evening  </td><td>16.85004 mins</td></tr>\n",
       "\t<tr><td>Morning  </td><td>15.59833 mins</td></tr>\n",
       "\t<tr><td>Night    </td><td>17.05856 mins</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 4 × 2\n",
       "\\begin{tabular}{ll}\n",
       " time\\_of\\_day & time\\\\\n",
       " <chr> & <drtn>\\\\\n",
       "\\hline\n",
       "\t Afternoon & 18.41503 mins\\\\\n",
       "\t Evening   & 16.85004 mins\\\\\n",
       "\t Morning   & 15.59833 mins\\\\\n",
       "\t Night     & 17.05856 mins\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 4 × 2\n",
       "\n",
       "| time_of_day &lt;chr&gt; | time &lt;drtn&gt; |\n",
       "|---|---|\n",
       "| Afternoon | 18.41503 mins |\n",
       "| Evening   | 16.85004 mins |\n",
       "| Morning   | 15.59833 mins |\n",
       "| Night     | 17.05856 mins |\n",
       "\n"
      ],
      "text/plain": [
       "  time_of_day time         \n",
       "1 Afternoon   18.41503 mins\n",
       "2 Evening     16.85004 mins\n",
       "3 Morning     15.59833 mins\n",
       "4 Night       17.05856 mins"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#.....morning........\n",
    "\n",
    "#average ride length by member type\n",
    "cyclistic_data %>% \n",
    "  group_by(member_casual) %>% \n",
    "  filter(time_of_day == \"Morning\") %>% \n",
    "  summarise_at(vars(ride_length),\n",
    "               list(time = mean))\n",
    "\n",
    "#average ride length\n",
    "cyclistic_data %>% \n",
    "  filter(time_of_day == \"Morning\") %>% \n",
    "  summarise_at(vars(ride_length),\n",
    "               list(time = mean))\n",
    "\n",
    "#.....afternoon........\n",
    "\n",
    "#average ride length by member type\n",
    "cyclistic_data %>% \n",
    "  group_by(member_casual) %>% \n",
    "  filter(time_of_day == \"Afternoon\") %>% \n",
    "  summarise_at(vars(ride_length),\n",
    "               list(time = mean))\n",
    "\n",
    "#average ride length\n",
    "cyclistic_data %>% \n",
    "  filter(time_of_day == \"Afternoon\") %>% \n",
    "  summarise_at(vars(ride_length),\n",
    "               list(time = mean))\n",
    "\n",
    "#....evening....\n",
    "\n",
    "#average ride length by member type\n",
    "cyclistic_data %>% \n",
    "  group_by(member_casual) %>% \n",
    "  filter(time_of_day == \"Evening\") %>% \n",
    "  summarise_at(vars(ride_length),\n",
    "               list(time = mean))\n",
    "\n",
    "#average ride length\n",
    "cyclistic_data %>% \n",
    "  filter(time_of_day == \"Evening\") %>% \n",
    "  summarise_at(vars(ride_length),\n",
    "               list(time = mean))\n",
    "\n",
    "#....night.....\n",
    "\n",
    "#average ride length by member type \n",
    "cyclistic_data %>% \n",
    "  group_by(member_casual) %>% \n",
    "  filter(time_of_day == \"Night\") %>% \n",
    "  summarise_at(vars(ride_length),\n",
    "               list(time = mean))\n",
    "\n",
    "#average ride length\n",
    "cyclistic_data %>% \n",
    "  filter(time_of_day == \"Night\") %>% \n",
    "  summarise_at(vars(ride_length),\n",
    "               list(time = mean))\n",
    "\n",
    "#.....all times of day.....\n",
    "\n",
    "#average ride length by member type\n",
    "cyclistic_data %>% \n",
    "  group_by(time_of_day, member_casual) %>% \n",
    "  summarise_at(vars(ride_length),\n",
    "               list(time = mean))\n",
    "\n",
    "#average ride length\n",
    "cyclistic_data %>% \n",
    "  group_by(time_of_day) %>% \n",
    "  summarise_at(vars(ride_length),\n",
    "               list(time = mean))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7883e5a5",
   "metadata": {
    "papermill": {
     "duration": 0.02341,
     "end_time": "2022-12-05T12:46:56.439269",
     "exception": false,
     "start_time": "2022-12-05T12:46:56.415859",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**#....DAY OF THE WEEK.....**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 27,
   "id": "1cd10d80",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T12:46:56.489173Z",
     "iopub.status.busy": "2022-12-05T12:46:56.487143Z",
     "iopub.status.idle": "2022-12-05T12:46:57.079330Z",
     "shell.execute_reply": "2022-12-05T12:46:57.076570Z"
    },
    "papermill": {
     "duration": 0.620795,
     "end_time": "2022-12-05T12:46:57.082848",
     "exception": false,
     "start_time": "2022-12-05T12:46:56.462053",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 14 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>day_of_week</th><th scope=col>time</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Friday   </td><td>22.68005 mins</td></tr>\n",
       "\t<tr><td>casual</td><td>Monday   </td><td>25.27896 mins</td></tr>\n",
       "\t<tr><td>casual</td><td>Saturday </td><td>26.95864 mins</td></tr>\n",
       "\t<tr><td>casual</td><td>Sunday   </td><td>27.64033 mins</td></tr>\n",
       "\t<tr><td>casual</td><td>Thursday </td><td>21.88746 mins</td></tr>\n",
       "\t<tr><td>casual</td><td>Tuesday  </td><td>21.85358 mins</td></tr>\n",
       "\t<tr><td>casual</td><td>Wednesday</td><td>21.20185 mins</td></tr>\n",
       "\t<tr><td>member</td><td>Friday   </td><td>12.21149 mins</td></tr>\n",
       "\t<tr><td>member</td><td>Monday   </td><td>12.01395 mins</td></tr>\n",
       "\t<tr><td>member</td><td>Saturday </td><td>14.03045 mins</td></tr>\n",
       "\t<tr><td>member</td><td>Sunday   </td><td>13.87152 mins</td></tr>\n",
       "\t<tr><td>member</td><td>Thursday </td><td>12.01618 mins</td></tr>\n",
       "\t<tr><td>member</td><td>Tuesday  </td><td>11.78205 mins</td></tr>\n",
       "\t<tr><td>member</td><td>Wednesday</td><td>11.83696 mins</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 14 × 3\n",
       "\\begin{tabular}{lll}\n",
       " member\\_casual & day\\_of\\_week & time\\\\\n",
       " <chr> & <chr> & <drtn>\\\\\n",
       "\\hline\n",
       "\t casual & Friday    & 22.68005 mins\\\\\n",
       "\t casual & Monday    & 25.27896 mins\\\\\n",
       "\t casual & Saturday  & 26.95864 mins\\\\\n",
       "\t casual & Sunday    & 27.64033 mins\\\\\n",
       "\t casual & Thursday  & 21.88746 mins\\\\\n",
       "\t casual & Tuesday   & 21.85358 mins\\\\\n",
       "\t casual & Wednesday & 21.20185 mins\\\\\n",
       "\t member & Friday    & 12.21149 mins\\\\\n",
       "\t member & Monday    & 12.01395 mins\\\\\n",
       "\t member & Saturday  & 14.03045 mins\\\\\n",
       "\t member & Sunday    & 13.87152 mins\\\\\n",
       "\t member & Thursday  & 12.01618 mins\\\\\n",
       "\t member & Tuesday   & 11.78205 mins\\\\\n",
       "\t member & Wednesday & 11.83696 mins\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 14 × 3\n",
       "\n",
       "| member_casual &lt;chr&gt; | day_of_week &lt;chr&gt; | time &lt;drtn&gt; |\n",
       "|---|---|---|\n",
       "| casual | Friday    | 22.68005 mins |\n",
       "| casual | Monday    | 25.27896 mins |\n",
       "| casual | Saturday  | 26.95864 mins |\n",
       "| casual | Sunday    | 27.64033 mins |\n",
       "| casual | Thursday  | 21.88746 mins |\n",
       "| casual | Tuesday   | 21.85358 mins |\n",
       "| casual | Wednesday | 21.20185 mins |\n",
       "| member | Friday    | 12.21149 mins |\n",
       "| member | Monday    | 12.01395 mins |\n",
       "| member | Saturday  | 14.03045 mins |\n",
       "| member | Sunday    | 13.87152 mins |\n",
       "| member | Thursday  | 12.01618 mins |\n",
       "| member | Tuesday   | 11.78205 mins |\n",
       "| member | Wednesday | 11.83696 mins |\n",
       "\n"
      ],
      "text/plain": [
       "   member_casual day_of_week time         \n",
       "1  casual        Friday      22.68005 mins\n",
       "2  casual        Monday      25.27896 mins\n",
       "3  casual        Saturday    26.95864 mins\n",
       "4  casual        Sunday      27.64033 mins\n",
       "5  casual        Thursday    21.88746 mins\n",
       "6  casual        Tuesday     21.85358 mins\n",
       "7  casual        Wednesday   21.20185 mins\n",
       "8  member        Friday      12.21149 mins\n",
       "9  member        Monday      12.01395 mins\n",
       "10 member        Saturday    14.03045 mins\n",
       "11 member        Sunday      13.87152 mins\n",
       "12 member        Thursday    12.01618 mins\n",
       "13 member        Tuesday     11.78205 mins\n",
       "14 member        Wednesday   11.83696 mins"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 7 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>day_of_week</th><th scope=col>time</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Friday   </td><td>16.46351 mins</td></tr>\n",
       "\t<tr><td>Monday   </td><td>16.74963 mins</td></tr>\n",
       "\t<tr><td>Saturday </td><td>20.75790 mins</td></tr>\n",
       "\t<tr><td>Sunday   </td><td>20.79055 mins</td></tr>\n",
       "\t<tr><td>Thursday </td><td>15.50269 mins</td></tr>\n",
       "\t<tr><td>Tuesday  </td><td>15.00794 mins</td></tr>\n",
       "\t<tr><td>Wednesday</td><td>14.90368 mins</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 7 × 2\n",
       "\\begin{tabular}{ll}\n",
       " day\\_of\\_week & time\\\\\n",
       " <chr> & <drtn>\\\\\n",
       "\\hline\n",
       "\t Friday    & 16.46351 mins\\\\\n",
       "\t Monday    & 16.74963 mins\\\\\n",
       "\t Saturday  & 20.75790 mins\\\\\n",
       "\t Sunday    & 20.79055 mins\\\\\n",
       "\t Thursday  & 15.50269 mins\\\\\n",
       "\t Tuesday   & 15.00794 mins\\\\\n",
       "\t Wednesday & 14.90368 mins\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 7 × 2\n",
       "\n",
       "| day_of_week &lt;chr&gt; | time &lt;drtn&gt; |\n",
       "|---|---|\n",
       "| Friday    | 16.46351 mins |\n",
       "| Monday    | 16.74963 mins |\n",
       "| Saturday  | 20.75790 mins |\n",
       "| Sunday    | 20.79055 mins |\n",
       "| Thursday  | 15.50269 mins |\n",
       "| Tuesday   | 15.00794 mins |\n",
       "| Wednesday | 14.90368 mins |\n",
       "\n"
      ],
      "text/plain": [
       "  day_of_week time         \n",
       "1 Friday      16.46351 mins\n",
       "2 Monday      16.74963 mins\n",
       "3 Saturday    20.75790 mins\n",
       "4 Sunday      20.79055 mins\n",
       "5 Thursday    15.50269 mins\n",
       "6 Tuesday     15.00794 mins\n",
       "7 Wednesday   14.90368 mins"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#average ride_length by member type\n",
    "cyclistic_data %>% group_by(member_casual, day_of_week) %>% \n",
    "  summarise_at(vars(ride_length),\n",
    "               list(time = mean))\n",
    "\n",
    "#average ride_length \n",
    "cyclistic_data %>% group_by(day_of_week) %>% \n",
    "  summarise_at(vars(ride_length),\n",
    "               list(time = mean))\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "95ead92b",
   "metadata": {
    "papermill": {
     "duration": 0.023817,
     "end_time": "2022-12-05T12:46:57.130551",
     "exception": false,
     "start_time": "2022-12-05T12:46:57.106734",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**#.....DAY OF THE MONTH.....**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 28,
   "id": "c6607d4f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T12:46:57.183634Z",
     "iopub.status.busy": "2022-12-05T12:46:57.181500Z",
     "iopub.status.idle": "2022-12-05T12:46:57.831764Z",
     "shell.execute_reply": "2022-12-05T12:46:57.829226Z"
    },
    "papermill": {
     "duration": 0.679444,
     "end_time": "2022-12-05T12:46:57.834349",
     "exception": false,
     "start_time": "2022-12-05T12:46:57.154905",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\u001b[90m# A tibble: 62 × 3\u001b[39m\n",
      "\u001b[90m# Groups:   day [31]\u001b[39m\n",
      "   day   member_casual time         \n",
      "   \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m         \u001b[3m\u001b[90m<drtn>\u001b[39m\u001b[23m       \n",
      "\u001b[90m 1\u001b[39m 01    casual        23.36029 mins\n",
      "\u001b[90m 2\u001b[39m 01    member        12.14832 mins\n",
      "\u001b[90m 3\u001b[39m 02    casual        24.93580 mins\n",
      "\u001b[90m 4\u001b[39m 02    member        12.44264 mins\n",
      "\u001b[90m 5\u001b[39m 03    casual        25.34504 mins\n",
      "\u001b[90m 6\u001b[39m 03    member        12.37191 mins\n",
      "\u001b[90m 7\u001b[39m 04    casual        25.34993 mins\n",
      "\u001b[90m 8\u001b[39m 04    member        12.33245 mins\n",
      "\u001b[90m 9\u001b[39m 05    casual        26.41335 mins\n",
      "\u001b[90m10\u001b[39m 05    member        12.77072 mins\n",
      "\u001b[90m11\u001b[39m 06    casual        23.87687 mins\n",
      "\u001b[90m12\u001b[39m 06    member        11.94827 mins\n",
      "\u001b[90m13\u001b[39m 07    casual        22.99647 mins\n",
      "\u001b[90m14\u001b[39m 07    member        12.45680 mins\n",
      "\u001b[90m15\u001b[39m 08    casual        22.78248 mins\n",
      "\u001b[90m16\u001b[39m 08    member        11.87817 mins\n",
      "\u001b[90m17\u001b[39m 09    casual        25.29127 mins\n",
      "\u001b[90m18\u001b[39m 09    member        12.94054 mins\n",
      "\u001b[90m19\u001b[39m 10    casual        25.80997 mins\n",
      "\u001b[90m20\u001b[39m 10    member        12.88748 mins\n",
      "\u001b[90m21\u001b[39m 11    casual        24.11922 mins\n",
      "\u001b[90m22\u001b[39m 11    member        12.40886 mins\n",
      "\u001b[90m23\u001b[39m 12    casual        24.71577 mins\n",
      "\u001b[90m24\u001b[39m 12    member        12.33889 mins\n",
      "\u001b[90m25\u001b[39m 13    casual        24.64892 mins\n",
      "\u001b[90m26\u001b[39m 13    member        12.40300 mins\n",
      "\u001b[90m27\u001b[39m 14    casual        25.35147 mins\n",
      "\u001b[90m28\u001b[39m 14    member        12.52937 mins\n",
      "\u001b[90m29\u001b[39m 15    casual        22.79760 mins\n",
      "\u001b[90m30\u001b[39m 15    member        12.06669 mins\n",
      "\u001b[90m31\u001b[39m 16    casual        24.64709 mins\n",
      "\u001b[90m32\u001b[39m 16    member        12.66696 mins\n",
      "\u001b[90m33\u001b[39m 17    casual        23.34621 mins\n",
      "\u001b[90m34\u001b[39m 17    member        12.38297 mins\n",
      "\u001b[90m35\u001b[39m 18    casual        23.64265 mins\n",
      "\u001b[90m36\u001b[39m 18    member        12.41010 mins\n",
      "\u001b[90m37\u001b[39m 19    casual        24.49332 mins\n",
      "\u001b[90m38\u001b[39m 19    member        12.46479 mins\n",
      "\u001b[90m39\u001b[39m 20    casual        23.53637 mins\n",
      "\u001b[90m40\u001b[39m 20    member        12.41420 mins\n",
      "\u001b[90m41\u001b[39m 21    casual        24.42280 mins\n",
      "\u001b[90m42\u001b[39m 21    member        12.76480 mins\n",
      "\u001b[90m43\u001b[39m 22    casual        24.07659 mins\n",
      "\u001b[90m44\u001b[39m 22    member        12.53248 mins\n",
      "\u001b[90m45\u001b[39m 23    casual        26.75801 mins\n",
      "\u001b[90m46\u001b[39m 23    member        13.02769 mins\n",
      "\u001b[90m47\u001b[39m 24    casual        23.89294 mins\n",
      "\u001b[90m48\u001b[39m 24    member        12.49444 mins\n",
      "\u001b[90m49\u001b[39m 25    casual        22.57400 mins\n",
      "\u001b[90m50\u001b[39m 25    member        12.19688 mins\n",
      "\u001b[90m51\u001b[39m 26    casual        23.67459 mins\n",
      "\u001b[90m52\u001b[39m 26    member        12.38546 mins\n",
      "\u001b[90m53\u001b[39m 27    casual        22.85840 mins\n",
      "\u001b[90m54\u001b[39m 27    member        11.99289 mins\n",
      "\u001b[90m55\u001b[39m 28    casual        24.21007 mins\n",
      "\u001b[90m56\u001b[39m 28    member        12.30455 mins\n",
      "\u001b[90m57\u001b[39m 29    casual        24.73000 mins\n",
      "\u001b[90m58\u001b[39m 29    member        12.46924 mins\n",
      "\u001b[90m59\u001b[39m 30    casual        25.03803 mins\n",
      "\u001b[90m60\u001b[39m 30    member        12.77998 mins\n",
      "\u001b[90m61\u001b[39m 31    casual        23.21172 mins\n",
      "\u001b[90m62\u001b[39m 31    member        12.57240 mins\n",
      "\u001b[90m# A tibble: 31 × 2\u001b[39m\n",
      "   day   time         \n",
      "   \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \u001b[3m\u001b[90m<drtn>\u001b[39m\u001b[23m       \n",
      "\u001b[90m 1\u001b[39m 01    16.31362 mins\n",
      "\u001b[90m 2\u001b[39m 02    17.42240 mins\n",
      "\u001b[90m 3\u001b[39m 03    17.86381 mins\n",
      "\u001b[90m 4\u001b[39m 04    17.52338 mins\n",
      "\u001b[90m 5\u001b[39m 05    18.62036 mins\n",
      "\u001b[90m 6\u001b[39m 06    16.50750 mins\n",
      "\u001b[90m 7\u001b[39m 07    16.44218 mins\n",
      "\u001b[90m 8\u001b[39m 08    15.67886 mins\n",
      "\u001b[90m 9\u001b[39m 09    18.01400 mins\n",
      "\u001b[90m10\u001b[39m 10    18.27125 mins\n",
      "\u001b[90m11\u001b[39m 11    16.96806 mins\n",
      "\u001b[90m12\u001b[39m 12    17.09791 mins\n",
      "\u001b[90m13\u001b[39m 13    17.26571 mins\n",
      "\u001b[90m14\u001b[39m 14    17.66404 mins\n",
      "\u001b[90m15\u001b[39m 15    16.09939 mins\n",
      "\u001b[90m16\u001b[39m 16    17.59846 mins\n",
      "\u001b[90m17\u001b[39m 17    16.87992 mins\n",
      "\u001b[90m18\u001b[39m 18    16.90752 mins\n",
      "\u001b[90m19\u001b[39m 19    17.23953 mins\n",
      "\u001b[90m20\u001b[39m 20    16.92818 mins\n",
      "\u001b[90m21\u001b[39m 21    17.38699 mins\n",
      "\u001b[90m22\u001b[39m 22    17.13800 mins\n",
      "\u001b[90m23\u001b[39m 23    18.98189 mins\n",
      "\u001b[90m24\u001b[39m 24    17.25478 mins\n",
      "\u001b[90m25\u001b[39m 25    16.18611 mins\n",
      "\u001b[90m26\u001b[39m 26    16.84397 mins\n",
      "\u001b[90m27\u001b[39m 27    16.08991 mins\n",
      "\u001b[90m28\u001b[39m 28    17.13042 mins\n",
      "\u001b[90m29\u001b[39m 29    17.66876 mins\n",
      "\u001b[90m30\u001b[39m 30    18.21606 mins\n",
      "\u001b[90m31\u001b[39m 31    16.68526 mins\n"
     ]
    }
   ],
   "source": [
    "#average ride_length by member type\n",
    "cyclistic_data %>% group_by(day, member_casual) %>% \n",
    "  summarise_at(vars(ride_length),\n",
    "               list(time = mean)) %>% \n",
    "  print(n=62)  #lets you view entire tibble\n",
    "\n",
    "#average ride_length\n",
    "cyclistic_data %>% group_by(day) %>% \n",
    "  summarise_at(vars(ride_length),\n",
    "               list(time = mean)) %>% \n",
    "  print(n=31)  #lets you view entire tibble"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b5900ba4",
   "metadata": {
    "papermill": {
     "duration": 0.024431,
     "end_time": "2022-12-05T12:46:57.884277",
     "exception": false,
     "start_time": "2022-12-05T12:46:57.859846",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**#......MONTH......**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 29,
   "id": "f11237e4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T12:46:57.936826Z",
     "iopub.status.busy": "2022-12-05T12:46:57.935163Z",
     "iopub.status.idle": "2022-12-05T12:46:58.403553Z",
     "shell.execute_reply": "2022-12-05T12:46:58.401641Z"
    },
    "papermill": {
     "duration": 0.497987,
     "end_time": "2022-12-05T12:46:58.406307",
     "exception": false,
     "start_time": "2022-12-05T12:46:57.908320",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\u001b[90m# A tibble: 24 × 3\u001b[39m\n",
      "\u001b[90m# Groups:   month [12]\u001b[39m\n",
      "   month member_casual time         \n",
      "   \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m         \u001b[3m\u001b[90m<drtn>\u001b[39m\u001b[23m       \n",
      "\u001b[90m 1\u001b[39m 01    casual        27.35524 mins\n",
      "\u001b[90m 2\u001b[39m 01    member        10.26992 mins\n",
      "\u001b[90m 3\u001b[39m 02    casual        24.82518 mins\n",
      "\u001b[90m 4\u001b[39m 02    member        10.64509 mins\n",
      "\u001b[90m 5\u001b[39m 03    casual        28.43888 mins\n",
      "\u001b[90m 6\u001b[39m 03    member        11.79691 mins\n",
      "\u001b[90m 7\u001b[39m 04    casual        25.94914 mins\n",
      "\u001b[90m 8\u001b[39m 04    member        11.60976 mins\n",
      "\u001b[90m 9\u001b[39m 05    casual        27.70655 mins\n",
      "\u001b[90m10\u001b[39m 05    member        13.30153 mins\n",
      "\u001b[90m11\u001b[39m 06    casual        25.02022 mins\n",
      "\u001b[90m12\u001b[39m 06    member        13.68453 mins\n",
      "\u001b[90m13\u001b[39m 07    casual        25.09502 mins\n",
      "\u001b[90m14\u001b[39m 07    member        13.50394 mins\n",
      "\u001b[90m15\u001b[39m 08    casual        23.28570 mins\n",
      "\u001b[90m16\u001b[39m 08    member        13.10697 mins\n",
      "\u001b[90m17\u001b[39m 09    casual        21.80479 mins\n",
      "\u001b[90m18\u001b[39m 09    member        12.62249 mins\n",
      "\u001b[90m19\u001b[39m 10    casual        20.46945 mins\n",
      "\u001b[90m20\u001b[39m 10    member        11.67568 mins\n",
      "\u001b[90m21\u001b[39m 11    casual        22.48274 mins\n",
      "\u001b[90m22\u001b[39m 11    member        10.95157 mins\n",
      "\u001b[90m23\u001b[39m 12    casual        24.84308 mins\n",
      "\u001b[90m24\u001b[39m 12    member        10.58142 mins\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 12 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>month</th><th scope=col>time</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>01</td><td>12.95763 mins</td></tr>\n",
       "\t<tr><td>02</td><td>13.05307 mins</td></tr>\n",
       "\t<tr><td>03</td><td>16.97125 mins</td></tr>\n",
       "\t<tr><td>04</td><td>16.44429 mins</td></tr>\n",
       "\t<tr><td>05</td><td>19.61466 mins</td></tr>\n",
       "\t<tr><td>06</td><td>19.02157 mins</td></tr>\n",
       "\t<tr><td>07</td><td>19.12514 mins</td></tr>\n",
       "\t<tr><td>08</td><td>17.64872 mins</td></tr>\n",
       "\t<tr><td>09</td><td>16.41308 mins</td></tr>\n",
       "\t<tr><td>10</td><td>14.88785 mins</td></tr>\n",
       "\t<tr><td>11</td><td>14.10437 mins</td></tr>\n",
       "\t<tr><td>12</td><td>14.22638 mins</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 12 × 2\n",
       "\\begin{tabular}{ll}\n",
       " month & time\\\\\n",
       " <chr> & <drtn>\\\\\n",
       "\\hline\n",
       "\t 01 & 12.95763 mins\\\\\n",
       "\t 02 & 13.05307 mins\\\\\n",
       "\t 03 & 16.97125 mins\\\\\n",
       "\t 04 & 16.44429 mins\\\\\n",
       "\t 05 & 19.61466 mins\\\\\n",
       "\t 06 & 19.02157 mins\\\\\n",
       "\t 07 & 19.12514 mins\\\\\n",
       "\t 08 & 17.64872 mins\\\\\n",
       "\t 09 & 16.41308 mins\\\\\n",
       "\t 10 & 14.88785 mins\\\\\n",
       "\t 11 & 14.10437 mins\\\\\n",
       "\t 12 & 14.22638 mins\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 12 × 2\n",
       "\n",
       "| month &lt;chr&gt; | time &lt;drtn&gt; |\n",
       "|---|---|\n",
       "| 01 | 12.95763 mins |\n",
       "| 02 | 13.05307 mins |\n",
       "| 03 | 16.97125 mins |\n",
       "| 04 | 16.44429 mins |\n",
       "| 05 | 19.61466 mins |\n",
       "| 06 | 19.02157 mins |\n",
       "| 07 | 19.12514 mins |\n",
       "| 08 | 17.64872 mins |\n",
       "| 09 | 16.41308 mins |\n",
       "| 10 | 14.88785 mins |\n",
       "| 11 | 14.10437 mins |\n",
       "| 12 | 14.22638 mins |\n",
       "\n"
      ],
      "text/plain": [
       "   month time         \n",
       "1  01    12.95763 mins\n",
       "2  02    13.05307 mins\n",
       "3  03    16.97125 mins\n",
       "4  04    16.44429 mins\n",
       "5  05    19.61466 mins\n",
       "6  06    19.02157 mins\n",
       "7  07    19.12514 mins\n",
       "8  08    17.64872 mins\n",
       "9  09    16.41308 mins\n",
       "10 10    14.88785 mins\n",
       "11 11    14.10437 mins\n",
       "12 12    14.22638 mins"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#average ride_length by member type\n",
    "cyclistic_data %>% group_by(month, member_casual) %>% \n",
    "  summarise_at(vars(ride_length),\n",
    "               list(time = mean)) %>% \n",
    "  print(n=24)  #lets you view entire tibble\n",
    "\n",
    "#average ride_length\n",
    "cyclistic_data %>% group_by(month) %>% \n",
    "  summarise_at(vars(ride_length),\n",
    "               list(time = mean))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "17adc141",
   "metadata": {
    "papermill": {
     "duration": 0.02528,
     "end_time": "2022-12-05T12:46:58.457149",
     "exception": false,
     "start_time": "2022-12-05T12:46:58.431869",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**#......SEASON.....**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 30,
   "id": "7c3dc5d5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-12-05T12:46:58.510975Z",
     "iopub.status.busy": "2022-12-05T12:46:58.509347Z",
     "iopub.status.idle": "2022-12-05T12:47:03.413323Z",
     "shell.execute_reply": "2022-12-05T12:47:03.410575Z"
    },
    "papermill": {
     "duration": 4.934991,
     "end_time": "2022-12-05T12:47:03.417056",
     "exception": false,
     "start_time": "2022-12-05T12:46:58.482065",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>time</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>27.41043 mins</td></tr>\n",
       "\t<tr><td>member</td><td>12.43592 mins</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " member\\_casual & time\\\\\n",
       " <chr> & <drtn>\\\\\n",
       "\\hline\n",
       "\t casual & 27.41043 mins\\\\\n",
       "\t member & 12.43592 mins\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 2 × 2\n",
       "\n",
       "| member_casual &lt;chr&gt; | time &lt;drtn&gt; |\n",
       "|---|---|\n",
       "| casual | 27.41043 mins |\n",
       "| member | 12.43592 mins |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual time         \n",
       "1 casual        27.41043 mins\n",
       "2 member        12.43592 mins"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 1 × 1</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>time</th></tr>\n",
       "\t<tr><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>18.1667 mins</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 1 × 1\n",
       "\\begin{tabular}{l}\n",
       " time\\\\\n",
       " <drtn>\\\\\n",
       "\\hline\n",
       "\t 18.1667 mins\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 1 × 1\n",
       "\n",
       "| time &lt;drtn&gt; |\n",
       "|---|\n",
       "| 18.1667 mins |\n",
       "\n"
      ],
      "text/plain": [
       "  time        \n",
       "1 18.1667 mins"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>time</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>24.51078 mins</td></tr>\n",
       "\t<tr><td>member</td><td>13.42974 mins</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " member\\_casual & time\\\\\n",
       " <chr> & <drtn>\\\\\n",
       "\\hline\n",
       "\t casual & 24.51078 mins\\\\\n",
       "\t member & 13.42974 mins\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 2 × 2\n",
       "\n",
       "| member_casual &lt;chr&gt; | time &lt;drtn&gt; |\n",
       "|---|---|\n",
       "| casual | 24.51078 mins |\n",
       "| member | 13.42974 mins |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual time         \n",
       "1 casual        24.51078 mins\n",
       "2 member        13.42974 mins"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 1 × 1</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>time</th></tr>\n",
       "\t<tr><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>18.61241 mins</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 1 × 1\n",
       "\\begin{tabular}{l}\n",
       " time\\\\\n",
       " <drtn>\\\\\n",
       "\\hline\n",
       "\t 18.61241 mins\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 1 × 1\n",
       "\n",
       "| time &lt;drtn&gt; |\n",
       "|---|\n",
       "| 18.61241 mins |\n",
       "\n"
      ],
      "text/plain": [
       "  time         \n",
       "1 18.61241 mins"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>time</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>21.45509 mins</td></tr>\n",
       "\t<tr><td>member</td><td>11.88915 mins</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " member\\_casual & time\\\\\n",
       " <chr> & <drtn>\\\\\n",
       "\\hline\n",
       "\t casual & 21.45509 mins\\\\\n",
       "\t member & 11.88915 mins\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 2 × 2\n",
       "\n",
       "| member_casual &lt;chr&gt; | time &lt;drtn&gt; |\n",
       "|---|---|\n",
       "| casual | 21.45509 mins |\n",
       "| member | 11.88915 mins |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual time         \n",
       "1 casual        21.45509 mins\n",
       "2 member        11.88915 mins"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 1 × 1</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>time</th></tr>\n",
       "\t<tr><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>15.39872 mins</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 1 × 1\n",
       "\\begin{tabular}{l}\n",
       " time\\\\\n",
       " <drtn>\\\\\n",
       "\\hline\n",
       "\t 15.39872 mins\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 1 × 1\n",
       "\n",
       "| time &lt;drtn&gt; |\n",
       "|---|\n",
       "| 15.39872 mins |\n",
       "\n"
      ],
      "text/plain": [
       "  time         \n",
       "1 15.39872 mins"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>time</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>25.27418 mins</td></tr>\n",
       "\t<tr><td>member</td><td>10.52161 mins</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " member\\_casual & time\\\\\n",
       " <chr> & <drtn>\\\\\n",
       "\\hline\n",
       "\t casual & 25.27418 mins\\\\\n",
       "\t member & 10.52161 mins\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 2 × 2\n",
       "\n",
       "| member_casual &lt;chr&gt; | time &lt;drtn&gt; |\n",
       "|---|---|\n",
       "| casual | 25.27418 mins |\n",
       "| member | 10.52161 mins |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual time         \n",
       "1 casual        25.27418 mins\n",
       "2 member        10.52161 mins"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 1 × 1</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>time</th></tr>\n",
       "\t<tr><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>13.6296 mins</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 1 × 1\n",
       "\\begin{tabular}{l}\n",
       " time\\\\\n",
       " <drtn>\\\\\n",
       "\\hline\n",
       "\t 13.6296 mins\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 1 × 1\n",
       "\n",
       "| time &lt;drtn&gt; |\n",
       "|---|\n",
       "| 13.6296 mins |\n",
       "\n"
      ],
      "text/plain": [
       "  time        \n",
       "1 13.6296 mins"
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
       "\t<tr><th scope=col>season</th><th scope=col>member_casual</th><th scope=col>time</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Fall  </td><td>casual</td><td>21.45509 mins</td></tr>\n",
       "\t<tr><td>Fall  </td><td>member</td><td>11.88915 mins</td></tr>\n",
       "\t<tr><td>Spring</td><td>casual</td><td>27.41043 mins</td></tr>\n",
       "\t<tr><td>Spring</td><td>member</td><td>12.43592 mins</td></tr>\n",
       "\t<tr><td>Summer</td><td>casual</td><td>24.51078 mins</td></tr>\n",
       "\t<tr><td>Summer</td><td>member</td><td>13.42974 mins</td></tr>\n",
       "\t<tr><td>Winter</td><td>casual</td><td>25.27418 mins</td></tr>\n",
       "\t<tr><td>Winter</td><td>member</td><td>10.52161 mins</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 8 × 3\n",
       "\\begin{tabular}{lll}\n",
       " season & member\\_casual & time\\\\\n",
       " <chr> & <chr> & <drtn>\\\\\n",
       "\\hline\n",
       "\t Fall   & casual & 21.45509 mins\\\\\n",
       "\t Fall   & member & 11.88915 mins\\\\\n",
       "\t Spring & casual & 27.41043 mins\\\\\n",
       "\t Spring & member & 12.43592 mins\\\\\n",
       "\t Summer & casual & 24.51078 mins\\\\\n",
       "\t Summer & member & 13.42974 mins\\\\\n",
       "\t Winter & casual & 25.27418 mins\\\\\n",
       "\t Winter & member & 10.52161 mins\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 8 × 3\n",
       "\n",
       "| season &lt;chr&gt; | member_casual &lt;chr&gt; | time &lt;drtn&gt; |\n",
       "|---|---|---|\n",
       "| Fall   | casual | 21.45509 mins |\n",
       "| Fall   | member | 11.88915 mins |\n",
       "| Spring | casual | 27.41043 mins |\n",
       "| Spring | member | 12.43592 mins |\n",
       "| Summer | casual | 24.51078 mins |\n",
       "| Summer | member | 13.42974 mins |\n",
       "| Winter | casual | 25.27418 mins |\n",
       "| Winter | member | 10.52161 mins |\n",
       "\n"
      ],
      "text/plain": [
       "  season member_casual time         \n",
       "1 Fall   casual        21.45509 mins\n",
       "2 Fall   member        11.88915 mins\n",
       "3 Spring casual        27.41043 mins\n",
       "4 Spring member        12.43592 mins\n",
       "5 Summer casual        24.51078 mins\n",
       "6 Summer member        13.42974 mins\n",
       "7 Winter casual        25.27418 mins\n",
       "8 Winter member        10.52161 mins"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 4 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>season</th><th scope=col>time</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Fall  </td><td>15.39872 mins</td></tr>\n",
       "\t<tr><td>Spring</td><td>18.16670 mins</td></tr>\n",
       "\t<tr><td>Summer</td><td>18.61241 mins</td></tr>\n",
       "\t<tr><td>Winter</td><td>13.62960 mins</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 4 × 2\n",
       "\\begin{tabular}{ll}\n",
       " season & time\\\\\n",
       " <chr> & <drtn>\\\\\n",
       "\\hline\n",
       "\t Fall   & 15.39872 mins\\\\\n",
       "\t Spring & 18.16670 mins\\\\\n",
       "\t Summer & 18.61241 mins\\\\\n",
       "\t Winter & 13.62960 mins\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 4 × 2\n",
       "\n",
       "| season &lt;chr&gt; | time &lt;drtn&gt; |\n",
       "|---|---|\n",
       "| Fall   | 15.39872 mins |\n",
       "| Spring | 18.16670 mins |\n",
       "| Summer | 18.61241 mins |\n",
       "| Winter | 13.62960 mins |\n",
       "\n"
      ],
      "text/plain": [
       "  season time         \n",
       "1 Fall   15.39872 mins\n",
       "2 Spring 18.16670 mins\n",
       "3 Summer 18.61241 mins\n",
       "4 Winter 13.62960 mins"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#-----spring------\n",
    "\n",
    "#average ride length by member type\n",
    "cyclistic_data %>% \n",
    "  group_by(member_casual) %>% \n",
    "  filter(season == \"Spring\") %>% \n",
    "  summarise_at(vars(ride_length),\n",
    "               list(time = mean))\n",
    "\n",
    "#average ride length\n",
    "cyclistic_data %>% \n",
    "  filter(season == \"Spring\") %>% \n",
    "  summarise_at(vars(ride_length),\n",
    "               list(time = mean))\n",
    "\n",
    "#-----summer------\n",
    "\n",
    "#average ride length by member type for summer \n",
    "cyclistic_data %>% \n",
    "  group_by(member_casual) %>% \n",
    "  filter(season == \"Summer\") %>% \n",
    "  summarise_at(vars(ride_length),\n",
    "               list(time = mean))\n",
    "\n",
    "#average ride length for summer \n",
    "cyclistic_data %>% \n",
    "  filter(season == \"Summer\") %>% \n",
    "  summarise_at(vars(ride_length),\n",
    "               list(time = mean))\n",
    "\n",
    "#-----fall------\n",
    "\n",
    "#average ride length by member type\n",
    "cyclistic_data %>% \n",
    "  group_by(member_casual) %>% \n",
    "  filter(season == \"Fall\") %>% \n",
    "  summarise_at(vars(ride_length),\n",
    "               list(time = mean))\n",
    "\n",
    "#average ride length\n",
    "cyclistic_data %>% \n",
    "  filter(season == \"Fall\") %>% \n",
    "  summarise_at(vars(ride_length),\n",
    "               list(time = mean))\n",
    "\n",
    "#-----winter-----\n",
    "\n",
    "#average ride length by member type\n",
    "cyclistic_data %>% \n",
    "  group_by(member_casual) %>% \n",
    "  filter(season == \"Winter\") %>% \n",
    "  summarise_at(vars(ride_length),\n",
    "               list(time = mean))\n",
    "\n",
    "#average ride length\n",
    "cyclistic_data %>% \n",
    "  filter(season == \"Winter\") %>% \n",
    "  summarise_at(vars(ride_length),\n",
    "               list(time = mean))\n",
    "\n",
    "#----all seasons----\n",
    "\n",
    "#average ride length by member type\n",
    "cyclistic_data %>% \n",
    "  group_by(season, member_casual) %>% \n",
    "  summarise_at(vars(ride_length),\n",
    "               list(time = mean))\n",
    "\n",
    "#average ride length \n",
    "cyclistic_data %>% \n",
    "  group_by(season) %>% \n",
    "  summarise_at(vars(ride_length),\n",
    "               list(time = mean))"
   ]
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
   "duration": 250.918509,
   "end_time": "2022-12-05T12:47:03.770980",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-12-05T12:42:52.852471",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
