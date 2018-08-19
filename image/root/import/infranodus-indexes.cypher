CREATE INDEX ON :User(name);
CREATE INDEX ON :User(uid);
CREATE INDEX ON :Concept(name);
CREATE INDEX ON :Concept(uid);
CREATE INDEX ON :Context(name);
CREATE INDEX ON :Context(uid);
CREATE INDEX ON :Context(by);
CREATE INDEX ON :Statement(name);
CREATE INDEX ON :Statement(uid);


MATCH ()-[r:BY]->() CALL apoc.index.addRelationshipByName('BY',r,['user','context','statement','gapscan']) RETURN count(*);
MATCH ()-[r:AT]->() CALL apoc.index.addRelationshipByName('AT',r,['user','context','statement','gapscan']) RETURN count(*);
MATCH ()-[r:IN]->() CALL apoc.index.addRelationshipByName('IN',r,['user','context','statement','gapscan']) RETURN count(*);
MATCH ()-[r:OF]->() CALL apoc.index.addRelationshipByName('OF',r,['user','context','statement','gapscan']) RETURN count(*);
MATCH ()-[r:TO]->() CALL apoc.index.addRelationshipByName('TO',r,['user','context','statement','gapscan']) RETURN count(*);

CALL apoc.trigger.add('RELATIONSHIP_INDEX_ADD_TO',"UNWIND {createdRelationships} AS r MATCH ()-[r:TO]->() CALL apoc.index.addRelationshipByName('TO',r,['user','context','statement','gapscan']) RETURN count(*)", {phase:'after'});
CALL apoc.trigger.add('RELATIONSHIP_INDEX_ADD_AT',"UNWIND {createdRelationships} AS r MATCH ()-[r:AT]->() CALL apoc.index.addRelationshipByName('AT',r,['user','context','statement','gapscan']) RETURN count(*)", {phase:'after'});
CALL apoc.trigger.add('RELATIONSHIP_INDEX_ADD_BY',"UNWIND {createdRelationships} AS r MATCH ()-[r:BY]->() CALL apoc.index.addRelationshipByName('BY',r,['user','context','statement','gapscan']) RETURN count(*)", {phase:'after'});
CALL apoc.trigger.add('RELATIONSHIP_INDEX_ADD_OF',"UNWIND {createdRelationships} AS r MATCH ()-[r:OF]->() CALL apoc.index.addRelationshipByName('OF',r,['user','context','statement','gapscan']) RETURN count(*)", {phase:'after'});
CALL apoc.trigger.add('RELATIONSHIP_INDEX_ADD_IN',"UNWIND {createdRelationships} AS r MATCH ()-[r:IN]->() CALL apoc.index.addRelationshipByName('IN',r,['user','context','statement','gapscan']) RETURN count(*)", {phase:'after'});

CALL apoc.trigger.add('RELATIONSHIP_INDEX_REMOVE_TO',"UNWIND {deletedRelationships} AS r MATCH ()-[r:TO]->() CALL apoc.index.removeRelationshipByName('TO',r) RETURN count(*)", {phase:'after'});
CALL apoc.trigger.add('RELATIONSHIP_INDEX_REMOVE_AT',"UNWIND {deletedRelationships} AS r MATCH ()-[r:AT]->() CALL apoc.index.removeRelationshipByName('AT',r) RETURN count(*)", {phase:'after'});
CALL apoc.trigger.add('RELATIONSHIP_INDEX_REMOVE_BY',"UNWIND {deletedRelationships} AS r MATCH ()-[r:BY]->() CALL apoc.index.removeRelationshipByName('BY',r) RETURN count(*)", {phase:'after'});
CALL apoc.trigger.add('RELATIONSHIP_INDEX_REMOVE_OF',"UNWIND {deletedRelationships} AS r MATCH ()-[r:OF]->() CALL apoc.index.removeRelationshipByName('OF',r) RETURN count(*)", {phase:'after'});
CALL apoc.trigger.add('RELATIONSHIP_INDEX_REMOVE_IN',"UNWIND {deletedRelationships} AS r MATCH ()-[r:IN]->() CALL apoc.index.removeRelationshipByName('IN',r) RETURN count(*)", {phase:'after'});
