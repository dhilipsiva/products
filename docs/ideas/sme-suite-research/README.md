# sme-suite: the research its history dropped

**Repository:** [dhilipsiva/sme-suite](https://github.com/dhilipsiva/sme-suite), invested (D6 = a): a single-tenant
CRM MVP with a minimal Leptos UI.

sme-suite imported four research files on 2025-11-16 (commit 086a68d) and deleted them the same evening
(c8db744). Two survive byte for byte in [crm](https://github.com/dhilipsiva/crm)'s `docs/` (`plan.md` and the
Gemini CRM-features report). The other two existed only in sme-suite's history, and are kept here as
background for the CRM work:

- [crm-and-hr-essential-features.md](crm-and-hr-essential-features.md): "SME CRM and HR Apps: Essential Features
  and Unified Architecture", converted with pandoc from [the original docx](original/crm-and-hr-essential-features.docx).
  A ChatGPT Deep Research report, per the docx's metadata (`docProps/custom.xml` names the generator; created
  2025-11-16).
- [codex-workflow.md](codex-workflow.md): a workflow for driving the build with a coding agent.

The CRM MVP's scope is set by D6: contacts, companies, a deal board, tasks and login, with CSV import; the HR half
of the research is out of scope for it.
