task(id,description,assignee,status).
create_task(id,description,assignee) :-
    assertz(task(id,description,assignee,false)).
assign_task(id,assignee) :-
    retract(task(id,_,_,_)),
    assertz(task(id,_,assignee,false)).
complete_task(id) :-
    retract(task(id,_,_,_)),
    assertz(task(id,_,_,completed)).
display_tasks :-
    forall(task(id,description,assignee,status),
           format('Task ID: ~w, Description: ~w, Assignee: ~w, Status: ~w~n', [id,description,assignee,status])).
display_tasks_by_assignee(assignee) :-
    forall(task(id,description,assignee,status),
           format('Task ID: ~w, Description: ~w, Status: ~w~n', [id,description,status])).
display_completed_tasks :-
    forall(task(_,description,assignee,completed),
           format('Task ID: ~w, Description: ~w, Assignee: ~w~n', [id,description,assignee])).

display_incomplete_tasks :-
    forall(task(_,description,assignee, incomplete),
           format('Task ID: ~w, Description: ~w, Assignee: ~w~n', [id,description,assignee])).
create_task(1, 'Implement login functionality', 'Alice').
