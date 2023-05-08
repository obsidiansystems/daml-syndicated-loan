# Syndicated Lending in DAML

This is application has been built by [Obsidian Systems](https://obsidian.systems) as an example of how [DAML](https://www.daml.com/) can be used to model syndicated lending.

A syndicated loan is a loan that is issued by multiple parties, called participants, via an intermediary, called an agent or arranger, to a borrower. Within that basic structure there are many, many possible variations.

![Syndicated Loan Summary](./doc/syndicated-loan-summary.png)

## Phases

> There are three principal phases to a syndicated transaction. The first is the pre-mandate phase during which the details of the proposed transaction are pitched, discussed and finalised. This pre-mandate phase is rarely shorter than one month and can be as long as one year depending on factors such as transaction complexity, market conditions and borrower sentiment. The second phase is the post-mandate phase during which the syndication itself takes place, and the facility agreements along with associated documentation are negotiated. It is concluded by the signing of the agreements and associated documentation, and sometimes a closing ceremony. This phase is usually completed in a period of six to eight weeks. The third and final phase is the post-signing phase, which lasts for the life of the facility itself and is rarely shorter than six months (in the case of a bridge loan for example) or longer than five years for standard syndicated transactions, although syndicated transactions on some aircraft and project financings have been contracted for a period of up to 18 years.
-- *Syndicated Lending: Practice and Documentation*

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
