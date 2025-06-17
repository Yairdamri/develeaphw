#!/bin/bash

if mkdir project_na && \
   mkdir project_na/me && \
   mkdir project_na/src && \
   mkdir project_na/docs && \
   mkdir project_na/data && \
   echo -e "# Project Documentation\n this project is to develeap home work $(date)" > project_na/README.md;
    then
    echo "Directories created successfully."
else
    echo "Failed to create directories."
fi
