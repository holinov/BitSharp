CREATE TABLE BlockchainMetadata
(
    Guid BINARY(16) NOT NULL,
    RootBlockHash BINARY(32) NOT NULL,
    TotalWork BINARY(64) NOT NULL,
    IsComplete INTEGER NOT NULL,
	CONSTRAINT PK_BlockchainMetaData PRIMARY KEY
	(
        Guid
	)
);

CREATE TABLE ChainedBlocks
(
    Guid BINARY(16) NOT NULL,
    RootBlockHash BINARY(32) NOT NULL,
	BlockHash BINARY(32) NOT NULL,
	PreviousBlockHash BINARY(32) NOT NULL,
	Height INTEGER NOT NULL,
	TotalWork BINARY(64) NOT NULL,
	CONSTRAINT PK_ChainedBlocks PRIMARY KEY
	(
        Guid,
        RootBlockHash,
		BlockHash
	)
);

CREATE INDEX IX_ChainedBlock_Guid_RootHash ON ChainedBlocks ( Guid, RootBlockHash );

CREATE TABLE UtxoData
(
	Guid BINARY(16) NOT NULL,
	RootBlockHash BINARY(32) NOT NULL,
	UtxoChunkBytes VARBINARY(100000) NOT NULL
);

CREATE INDEX IX_UtxoData_Guid_RootBlockHash ON UtxoData ( Guid, RootBlockHash );
