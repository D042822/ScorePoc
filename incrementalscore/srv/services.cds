namespace sap.capire.incrementalscore;

using { sap.capire.incrementalscore as my } from '../db/schema';

service IncrementScoreService {
  entity IncrementScores as projection on my.IncrementScores;
  action activate (incrementalscore:IncrementScores.ID);
  action de_activate (incrementalscore:IncrementScores.ID);
  // Input validation
  annotate IncrementScores with {
    subjectOrigin  @mandatory;
    subjectType    @mandatory;
    subjectKey     @mandatory;
  }

  entity Rules as projection on my.Rules;

  entity Persistences as projection on my.Persistences;
  // Input validation
  annotate Persistences with {
    score_ID  @mandatory;
    PersistenceFrequency    @mandatory @assert.enum;
    ExecutionStartWeekday   @assert.enum;
    ExecutionStartHour      @mandatory;
  }
}

