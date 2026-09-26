ALTER TABLE "agent_api_keys" DROP CONSTRAINT "agent_api_keys_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "agent_runtime_state" DROP CONSTRAINT "agent_runtime_state_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "agent_wakeup_requests" DROP CONSTRAINT "agent_wakeup_requests_company_id_companies_id_fk";
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
ALTER TABLE "completion_contracts" DROP CONSTRAINT "completion_contracts_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "goals" DROP CONSTRAINT "goals_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "heartbeat_run_events" DROP CONSTRAINT "heartbeat_run_events_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "inbox_dismissals" DROP CONSTRAINT "inbox_dismissals_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "invites" DROP CONSTRAINT "invites_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "join_requests" DROP CONSTRAINT "join_requests_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "native_run_finalizations" DROP CONSTRAINT "native_run_finalizations_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "native_run_results" DROP CONSTRAINT "native_run_results_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "principal_permission_grants" DROP CONSTRAINT "principal_permission_grants_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "projects" DROP CONSTRAINT "projects_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "status_decision_effects" DROP CONSTRAINT "status_decision_effects_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "status_decisions" DROP CONSTRAINT "status_decisions_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "work_assessments" DROP CONSTRAINT "work_assessments_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "work_assessments" DROP CONSTRAINT "work_assessments_trigger_actor_company_id_companies_id_fk";
--> statement-breakpoint
ALTER TABLE "agent_api_keys" ADD CONSTRAINT "agent_api_keys_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "agent_runtime_state" ADD CONSTRAINT "agent_runtime_state_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "agent_wakeup_requests" ADD CONSTRAINT "agent_wakeup_requests_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "approval_comments" ADD CONSTRAINT "approval_comments_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "approvals" ADD CONSTRAINT "approvals_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "assets" ADD CONSTRAINT "assets_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "budget_incidents" ADD CONSTRAINT "budget_incidents_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "budget_policies" ADD CONSTRAINT "budget_policies_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "company_memberships" ADD CONSTRAINT "company_memberships_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "completion_contracts" ADD CONSTRAINT "completion_contracts_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "goals" ADD CONSTRAINT "goals_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "heartbeat_run_events" ADD CONSTRAINT "heartbeat_run_events_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "inbox_dismissals" ADD CONSTRAINT "inbox_dismissals_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "invites" ADD CONSTRAINT "invites_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "join_requests" ADD CONSTRAINT "join_requests_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "native_run_finalizations" ADD CONSTRAINT "native_run_finalizations_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "native_run_results" ADD CONSTRAINT "native_run_results_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "principal_permission_grants" ADD CONSTRAINT "principal_permission_grants_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "projects" ADD CONSTRAINT "projects_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "status_decision_effects" ADD CONSTRAINT "status_decision_effects_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "status_decisions" ADD CONSTRAINT "status_decisions_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "work_assessments" ADD CONSTRAINT "work_assessments_company_id_companies_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "work_assessments" ADD CONSTRAINT "work_assessments_trigger_actor_company_id_companies_id_fk" FOREIGN KEY ("trigger_actor_company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;