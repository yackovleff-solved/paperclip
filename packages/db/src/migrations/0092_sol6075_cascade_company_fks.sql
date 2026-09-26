ALTER TABLE "activity_log" DROP CONSTRAINT "activity_log_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "agent_api_keys" DROP CONSTRAINT "agent_api_keys_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "agent_config_revisions" DROP CONSTRAINT "agent_config_revisions_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "agent_runtime_state" DROP CONSTRAINT "agent_runtime_state_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "agent_task_sessions" DROP CONSTRAINT "agent_task_sessions_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "agent_wakeup_requests" DROP CONSTRAINT "agent_wakeup_requests_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "agents" DROP CONSTRAINT "agents_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "approval_comments" DROP CONSTRAINT "approval_comments_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "approvals" DROP CONSTRAINT "approvals_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "assets" DROP CONSTRAINT "assets_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "budget_incidents" DROP CONSTRAINT "budget_incidents_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "budget_policies" DROP CONSTRAINT "budget_policies_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "company_memberships" DROP CONSTRAINT "company_memberships_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "company_secret_bindings" DROP CONSTRAINT "company_secret_bindings_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "company_secrets" DROP CONSTRAINT "company_secrets_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "company_skills" DROP CONSTRAINT "company_skills_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "cost_events" DROP CONSTRAINT "cost_events_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "document_annotation_anchor_snapshots" DROP CONSTRAINT "document_annotation_anchor_snapshots_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "document_annotation_comments" DROP CONSTRAINT "document_annotation_comments_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "document_annotation_threads" DROP CONSTRAINT "document_annotation_threads_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "document_revisions" DROP CONSTRAINT "document_revisions_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "documents" DROP CONSTRAINT "documents_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "execution_workspaces" DROP CONSTRAINT "execution_workspaces_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "feedback_exports" DROP CONSTRAINT "feedback_exports_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "feedback_votes" DROP CONSTRAINT "feedback_votes_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "finance_events" DROP CONSTRAINT "finance_events_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "goals" DROP CONSTRAINT "goals_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "heartbeat_run_events" DROP CONSTRAINT "heartbeat_run_events_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "heartbeat_run_watchdog_decisions" DROP CONSTRAINT "heartbeat_run_watchdog_decisions_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "heartbeat_runs" DROP CONSTRAINT "heartbeat_runs_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "inbox_dismissals" DROP CONSTRAINT "inbox_dismissals_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "invites" DROP CONSTRAINT "invites_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "issue_approvals" DROP CONSTRAINT "issue_approvals_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "issue_attachments" DROP CONSTRAINT "issue_attachments_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "issue_comments" DROP CONSTRAINT "issue_comments_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "issue_documents" DROP CONSTRAINT "issue_documents_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "issue_execution_decisions" DROP CONSTRAINT "issue_execution_decisions_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "issue_inbox_archives" DROP CONSTRAINT "issue_inbox_archives_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "issue_read_states" DROP CONSTRAINT "issue_read_states_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "issue_recovery_actions" DROP CONSTRAINT "issue_recovery_actions_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "issue_reference_mentions" DROP CONSTRAINT "issue_reference_mentions_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "issue_relations" DROP CONSTRAINT "issue_relations_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "issue_thread_interactions" DROP CONSTRAINT "issue_thread_interactions_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "issue_tree_hold_members" DROP CONSTRAINT "issue_tree_hold_members_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "issue_tree_holds" DROP CONSTRAINT "issue_tree_holds_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "issue_work_products" DROP CONSTRAINT "issue_work_products_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "issues" DROP CONSTRAINT "issues_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "join_requests" DROP CONSTRAINT "join_requests_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "principal_permission_grants" DROP CONSTRAINT "principal_permission_grants_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "project_goals" DROP CONSTRAINT "project_goals_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "project_workspaces" DROP CONSTRAINT "project_workspaces_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "projects" DROP CONSTRAINT "projects_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "workspace_operations" DROP CONSTRAINT "workspace_operations_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "workspace_runtime_services" DROP CONSTRAINT "workspace_runtime_services_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "activity_log" ADD CONSTRAINT "activity_log_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "agent_api_keys" ADD CONSTRAINT "agent_api_keys_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "agent_config_revisions" ADD CONSTRAINT "agent_config_revisions_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "agent_runtime_state" ADD CONSTRAINT "agent_runtime_state_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "agent_task_sessions" ADD CONSTRAINT "agent_task_sessions_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "agent_wakeup_requests" ADD CONSTRAINT "agent_wakeup_requests_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "agents" ADD CONSTRAINT "agents_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "approval_comments" ADD CONSTRAINT "approval_comments_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "approvals" ADD CONSTRAINT "approvals_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "assets" ADD CONSTRAINT "assets_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "budget_incidents" ADD CONSTRAINT "budget_incidents_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "budget_policies" ADD CONSTRAINT "budget_policies_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "company_memberships" ADD CONSTRAINT "company_memberships_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "company_secret_bindings" ADD CONSTRAINT "company_secret_bindings_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "company_secrets" ADD CONSTRAINT "company_secrets_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "company_skills" ADD CONSTRAINT "company_skills_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "cost_events" ADD CONSTRAINT "cost_events_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "document_annotation_anchor_snapshots" ADD CONSTRAINT "document_annotation_anchor_snapshots_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "document_annotation_comments" ADD CONSTRAINT "document_annotation_comments_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "document_annotation_threads" ADD CONSTRAINT "document_annotation_threads_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "document_revisions" ADD CONSTRAINT "document_revisions_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "documents" ADD CONSTRAINT "documents_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "execution_workspaces" ADD CONSTRAINT "execution_workspaces_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "feedback_exports" ADD CONSTRAINT "feedback_exports_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "feedback_votes" ADD CONSTRAINT "feedback_votes_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "finance_events" ADD CONSTRAINT "finance_events_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "goals" ADD CONSTRAINT "goals_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "heartbeat_run_events" ADD CONSTRAINT "heartbeat_run_events_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "heartbeat_run_watchdog_decisions" ADD CONSTRAINT "heartbeat_run_watchdog_decisions_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "heartbeat_runs" ADD CONSTRAINT "heartbeat_runs_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "inbox_dismissals" ADD CONSTRAINT "inbox_dismissals_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "invites" ADD CONSTRAINT "invites_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "issue_approvals" ADD CONSTRAINT "issue_approvals_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "issue_attachments" ADD CONSTRAINT "issue_attachments_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "issue_comments" ADD CONSTRAINT "issue_comments_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "issue_documents" ADD CONSTRAINT "issue_documents_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "issue_execution_decisions" ADD CONSTRAINT "issue_execution_decisions_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "issue_inbox_archives" ADD CONSTRAINT "issue_inbox_archives_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "issue_read_states" ADD CONSTRAINT "issue_read_states_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "issue_recovery_actions" ADD CONSTRAINT "issue_recovery_actions_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "issue_reference_mentions" ADD CONSTRAINT "issue_reference_mentions_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "issue_relations" ADD CONSTRAINT "issue_relations_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "issue_thread_interactions" ADD CONSTRAINT "issue_thread_interactions_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "issue_tree_hold_members" ADD CONSTRAINT "issue_tree_hold_members_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "issue_tree_holds" ADD CONSTRAINT "issue_tree_holds_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "issue_work_products" ADD CONSTRAINT "issue_work_products_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "issues" ADD CONSTRAINT "issues_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "join_requests" ADD CONSTRAINT "join_requests_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "principal_permission_grants" ADD CONSTRAINT "principal_permission_grants_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "project_goals" ADD CONSTRAINT "project_goals_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "project_workspaces" ADD CONSTRAINT "project_workspaces_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "projects" ADD CONSTRAINT "projects_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "workspace_operations" ADD CONSTRAINT "workspace_operations_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "workspace_runtime_services" ADD CONSTRAINT "workspace_runtime_services_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;