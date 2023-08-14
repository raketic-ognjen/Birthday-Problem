{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "bf3f2501",
   "metadata": {
    "papermill": {
     "duration": 0.008761,
     "end_time": "2023-08-14T09:04:45.661787",
     "exception": false,
     "start_time": "2023-08-14T09:04:45.653026",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Probability of Coincidences and the Birthday Problem\n",
    "\n",
    "Today we have only taken very first steps in probability and in R\n",
    "\n",
    "Yet what we learned today, even if little, is already extremely powerful and leads us into the middle of meaningful and serious applications\n",
    "\n",
    "We discuss now one of them: The probability of coincidences\n",
    "\n",
    "What is the probability that at least two people in a room (virtual or real) share the same birthday, assuming\n",
    "\n",
    "No leap years\n",
    "\n",
    "Birthdays at any day are equally probably\n",
    "\n",
    "Birthdays are independent (no twins for example)\n",
    "\n",
    "Now for the sake of familiarizing ourselves with the new concepts, let us try to map the birthday problem into the probability notions we learned so far\n",
    "\n",
    "The sample space is the set of possible outcomes of the experiment\n",
    "\n",
    "Assume we have n people in the room\n",
    "\n",
    "Since each person can have a birthday at any of the 365 days in the year and we have n people in the room, the possible basic outcomes are 365 × 365 × 365 · · · 365 taken n times. This will produce a set with 365^n ordered n − tuples or sequences of birthdays\n",
    "\n",
    "This is the sample space of the birthday problem, written as S = {x |x ∈ 365^n} in set theoretic notation\n",
    "\n",
    "It means the sample space is the set of all ordered n − tuples from the Cartesian product 365^n\n",
    "\n",
    "Given a sample space we can assign a probability to the event that two people chosen at random will have the same birthday\n",
    "\n",
    "The denominator - equally probable cases as in classical probability - will this be 365^n\n",
    "\n",
    "The nominator for this probability will be much more straightforward to figure out, if we compute the complement. We discussed before that the probability of the complement of an event is 1 minus the probability of the event\n",
    "\n",
    "Translated to the birthday problem, this means we look for the 1 minus the probability that that all birthdays are different\n",
    "\n",
    "The probability that the second person has a different birthday from the first is 364/365\n",
    "\n",
    "If they are different the probability that the third person has a different birthday from them is 363/365 and so on for all n in the room Thus the probability of a shared birthday in the room is:\n",
    "\n",
    "$1 − P(A) = 1 − \\frac{365 × 364 × 363 · · · × (365 − n + 1)}{(365^n)}$\n",
    "\n",
    "where A is the event that all birthdays are different.\n",
    "\n",
    "There is an additional thing we did not yet introduce and which we will learn about in the next lecture\n",
    "\n",
    "This refers to our assumption that the individual birthdays are independent. For the moment you need to take the following fact on faith: The probability of independent events is the product of the probability these events\n",
    "\n",
    "There are 54 people signed up for this program\n",
    "\n",
    "Using R's product function prod(), the power operator ˆ and the colon operator : we already know"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "9a59778d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-08-14T09:04:45.680435Z",
     "iopub.status.busy": "2023-08-14T09:04:45.678067Z",
     "iopub.status.idle": "2023-08-14T09:04:45.815584Z",
     "shell.execute_reply": "2023-08-14T09:04:45.813589Z"
    },
    "papermill": {
     "duration": 0.152083,
     "end_time": "2023-08-14T09:04:45.820500",
     "exception": false,
     "start_time": "2023-08-14T09:04:45.668417",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0.983876962758852"
      ],
      "text/latex": [
       "0.983876962758852"
      ],
      "text/markdown": [
       "0.983876962758852"
      ],
      "text/plain": [
       "[1] 0.983877"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "1- prod(365:312)/365^54"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "8ec3e0ba",
   "metadata": {
    "papermill": {
     "duration": 0.007066,
     "end_time": "2023-08-14T09:04:45.834563",
     "exception": false,
     "start_time": "2023-08-14T09:04:45.827497",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "An R function could be written like this: birthday_collisions"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "1f8c60b2",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-08-14T09:04:45.891340Z",
     "iopub.status.busy": "2023-08-14T09:04:45.851661Z",
     "iopub.status.idle": "2023-08-14T09:04:45.904315Z",
     "shell.execute_reply": "2023-08-14T09:04:45.902391Z"
    },
    "papermill": {
     "duration": 0.064809,
     "end_time": "2023-08-14T09:04:45.907236",
     "exception": false,
     "start_time": "2023-08-14T09:04:45.842427",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "birthday_collisions <- function(n) {\n",
    "  1 - prod(365:(365-n+1))/365^n\n",
    "}"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4ad5268d",
   "metadata": {
    "papermill": {
     "duration": 0.006725,
     "end_time": "2023-08-14T09:04:45.921219",
     "exception": false,
     "start_time": "2023-08-14T09:04:45.914494",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Check n = 23:"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "37588ef9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-08-14T09:04:45.938687Z",
     "iopub.status.busy": "2023-08-14T09:04:45.936969Z",
     "iopub.status.idle": "2023-08-14T09:04:45.959055Z",
     "shell.execute_reply": "2023-08-14T09:04:45.957069Z"
    },
    "papermill": {
     "duration": 0.033672,
     "end_time": "2023-08-14T09:04:45.961692",
     "exception": false,
     "start_time": "2023-08-14T09:04:45.928020",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0.507297234323985"
      ],
      "text/latex": [
       "0.507297234323985"
      ],
      "text/markdown": [
       "0.507297234323985"
      ],
      "text/plain": [
       "[1] 0.5072972"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "birthday_collisions(n=23)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "44eb2702",
   "metadata": {
    "papermill": {
     "duration": 0.006778,
     "end_time": "2023-08-14T09:04:45.977020",
     "exception": false,
     "start_time": "2023-08-14T09:04:45.970242",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Assume this derivation and all the formulas gave you quite a headache\n",
    "\n",
    "But you feel quite at ease with the R part of the lecture.\n",
    "\n",
    "Could we figure out coincidence probabilities by simulation\n",
    "\n",
    "Lets give it a try\n",
    "\n",
    "Lets simulate 54 random birthdays"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "1d3ad027",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-08-14T09:04:45.994682Z",
     "iopub.status.busy": "2023-08-14T09:04:45.992930Z",
     "iopub.status.idle": "2023-08-14T09:04:46.009828Z",
     "shell.execute_reply": "2023-08-14T09:04:46.006850Z"
    },
    "papermill": {
     "duration": 0.030157,
     "end_time": "2023-08-14T09:04:46.014038",
     "exception": false,
     "start_time": "2023-08-14T09:04:45.983881",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "b_54 <- sample(1:365,54,replace = TRUE)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9fee184a",
   "metadata": {
    "papermill": {
     "duration": 0.006582,
     "end_time": "2023-08-14T09:04:46.027384",
     "exception": false,
     "start_time": "2023-08-14T09:04:46.020802",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "We know sample but what does the replace argument say? It means that once we drew a birthday from 365, when we make the next draw down to the 54th person at each draw all birthdays are possible\n",
    "\n",
    "Would replace be set to FALSE and we had drawn 10.02.1988 - my birthday - it could not be drawn again for the next person. But this is not what we want\n",
    "\n",
    "We would like to find out the number of matches in a random draw automatically\n",
    "\n",
    "This can be done using the R functions length()and unique()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "f2d87a55",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-08-14T09:04:46.045011Z",
     "iopub.status.busy": "2023-08-14T09:04:46.043222Z",
     "iopub.status.idle": "2023-08-14T09:04:46.059588Z",
     "shell.execute_reply": "2023-08-14T09:04:46.057464Z"
    },
    "papermill": {
     "duration": 0.028573,
     "end_time": "2023-08-14T09:04:46.062946",
     "exception": false,
     "start_time": "2023-08-14T09:04:46.034373",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "m_54 <- 54 - length(unique(b_54))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "f768e80d",
   "metadata": {
    "papermill": {
     "duration": 0.006407,
     "end_time": "2023-08-14T09:04:46.076292",
     "exception": false,
     "start_time": "2023-08-14T09:04:46.069885",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "We know sample but what does the replace argument say? It means that once we drew a birthday from 365, when we make the next draw down to the 54th person at each draw all birthdays are possible\n",
    "\n",
    "Would replace be set to FALSE and we had drawn 19.6.1967 - my birthday - it could not be drawn again for the next person. But this is not what we want\n",
    "\n",
    "We would like to find out the number of matches in a random draw automatically\n",
    "\n",
    "This can be done using the R functions length()and unique()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "eb44ac80",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-08-14T09:04:46.093367Z",
     "iopub.status.busy": "2023-08-14T09:04:46.091392Z",
     "iopub.status.idle": "2023-08-14T09:04:46.111362Z",
     "shell.execute_reply": "2023-08-14T09:04:46.109283Z"
    },
    "papermill": {
     "duration": 0.031973,
     "end_time": "2023-08-14T09:04:46.114698",
     "exception": false,
     "start_time": "2023-08-14T09:04:46.082725",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "m_54 <- 54 - length(unique(b_54))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "765028d0",
   "metadata": {
    "papermill": {
     "duration": 0.006488,
     "end_time": "2023-08-14T09:04:46.127775",
     "exception": false,
     "start_time": "2023-08-14T09:04:46.121287",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "For example if the random draw yielded 54 different birthdays, this would be a unique profile and length() would give 54, resulting in m54 = 0\n",
    "\n",
    "Now as with the die before, let us pack this process into a function"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "4ed702d0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-08-14T09:04:46.144809Z",
     "iopub.status.busy": "2023-08-14T09:04:46.143044Z",
     "iopub.status.idle": "2023-08-14T09:04:46.158969Z",
     "shell.execute_reply": "2023-08-14T09:04:46.157070Z"
    },
    "papermill": {
     "duration": 0.028132,
     "end_time": "2023-08-14T09:04:46.162422",
     "exception": false,
     "start_time": "2023-08-14T09:04:46.134290",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "sim_54 <- function() {\n",
    "  b_54 <- sample(1:365,54,replace= TRUE)\n",
    "  (54 - length(unique(b_54)))\n",
    "}"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e2c058f0",
   "metadata": {
    "papermill": {
     "duration": 0.006995,
     "end_time": "2023-08-14T09:04:46.175907",
     "exception": false,
     "start_time": "2023-08-14T09:04:46.168912",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "And repeat"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "8330660d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-08-14T09:04:46.193375Z",
     "iopub.status.busy": "2023-08-14T09:04:46.191587Z",
     "iopub.status.idle": "2023-08-14T09:04:46.471228Z",
     "shell.execute_reply": "2023-08-14T09:04:46.469263Z"
    },
    "papermill": {
     "duration": 0.292944,
     "end_time": "2023-08-14T09:04:46.475754",
     "exception": false,
     "start_time": "2023-08-14T09:04:46.182810",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "simprobs_54 <- replicate(10000, sim_54())"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "f96f3410",
   "metadata": {
    "papermill": {
     "duration": 0.006866,
     "end_time": "2023-08-14T09:04:46.489409",
     "exception": false,
     "start_time": "2023-08-14T09:04:46.482543",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Now how do we get from here to probabilities?\n",
    "\n",
    "Here we anticipate and introduce a new probability concept which we will discuss in more detail in the next lecture but which you perhaps already came across a few times\n",
    "\n",
    "This concept could be called the relative frequency probability . In this concept the probability of an event A is defined as\n",
    "\n",
    "$P(A) = \\frac{Number of times A occurs in repeated identical trials}{Total number of trials in a random experiment}$\n",
    "\n",
    "What I show you now, we will learn in the next lecture, so don't worry if you do not exactly understand the syntax at the moment\n",
    "\n",
    "In the numerator I ask R to count the number of 0s (no birthday collisions) in the object simprobs_54 and then I divide it by 10000, just as in the definition of relative frequency probability. Then I compute 1 minus this relative frequency"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "484ecc2b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-08-14T09:04:46.513368Z",
     "iopub.status.busy": "2023-08-14T09:04:46.511265Z",
     "iopub.status.idle": "2023-08-14T09:04:46.530594Z",
     "shell.execute_reply": "2023-08-14T09:04:46.528695Z"
    },
    "papermill": {
     "duration": 0.037497,
     "end_time": "2023-08-14T09:04:46.533791",
     "exception": false,
     "start_time": "2023-08-14T09:04:46.496294",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0.9855"
      ],
      "text/latex": [
       "0.9855"
      ],
      "text/markdown": [
       "0.9855"
      ],
      "text/plain": [
       "[1] 0.9855"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "1-length((simprobs_54[simprobs_54==0]))/10000"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ab0ab029",
   "metadata": {
    "papermill": {
     "duration": 0.007979,
     "end_time": "2023-08-14T09:04:46.549742",
     "exception": false,
     "start_time": "2023-08-14T09:04:46.541763",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Pretty close to the analytically derived probability:"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "14d706f4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-08-14T09:04:46.569172Z",
     "iopub.status.busy": "2023-08-14T09:04:46.567383Z",
     "iopub.status.idle": "2023-08-14T09:04:46.591848Z",
     "shell.execute_reply": "2023-08-14T09:04:46.589872Z"
    },
    "papermill": {
     "duration": 0.037032,
     "end_time": "2023-08-14T09:04:46.594524",
     "exception": false,
     "start_time": "2023-08-14T09:04:46.557492",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0.983876962758852"
      ],
      "text/latex": [
       "0.983876962758852"
      ],
      "text/markdown": [
       "0.983876962758852"
      ],
      "text/plain": [
       "[1] 0.983877"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "birthday_collisions(n=54)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3be7aceb",
   "metadata": {
    "papermill": {
     "duration": 0.007593,
     "end_time": "2023-08-14T09:04:46.609596",
     "exception": false,
     "start_time": "2023-08-14T09:04:46.602003",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Isn't this super-cool?\n",
    "\n",
    "The birthday problem is the canonical model for the probabilistic study of coincidences of all kinds"
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
   "duration": 4.723172,
   "end_time": "2023-08-14T09:04:46.743313",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-08-14T09:04:42.020141",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
