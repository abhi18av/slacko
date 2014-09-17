let token =
  let doc = "The Slack API access token" in
  Cmdliner.Arg.(value & opt string "" & info ["t"; "token"] ~docv:"TOKEN" ~doc)

let info =
  let doc = "Writes messages to slack" in
  Cmdliner.Term.info "slack-notify" ~doc

let execute token =
  "Your token is " ^ token ^ "."
  |> print_endline

let execute_t = Cmdliner.Term.(pure execute $ token)

let () =
  match Cmdliner.Term.eval (execute_t, info) with
    | `Error _ -> exit 1
    | _ -> exit 0
