# Syndicated Lending in DAML

This is application has been built by [Obsidian Systems](https://obsidian.systems) as an example of how [DAML](https://www.daml.com/) can be used to model syndicated lending.

A syndicated loan is a loan that is issued by multiple parties, called participants, via an intermediary, called an agent or arranger, to a borrower. Within that basic structure there are many, many possible variations.

## Parties

A basic syndicated loan involves the following primary parties:

* a single borrower who requests a loan from an agent;
* an agent (also called an arranger) who collects the borrowers information, underwrites the loan, and then proposes it (without the borrowers personal information) to a group of participant lenders;
* participants, who review the agent's proposals and offer loans for set sums and interest rates to satisfy part of the loan request.

## Workflows

This application models loan origination and servicing.


# Code Samples - Getting Started

This project contains the source code used in the getting-started tutorials.

Before opening Visual Studio Code you should run `./get-dependencies.sh` (or `get-dependencies.bat`
for Windows users) to download the required Daml packages.

You can then open Daml Studio by running `daml studio`, or build the project using `daml build`.

To run the project, run `daml start` (which also builds the project).
