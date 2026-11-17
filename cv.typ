// CV — build with `make` (see Makefile).

#set document(title: "CV – David Sebastian Hoffmann", author: "David Sebastian Hoffmann", date: none)
#set page(paper: "a4", margin: (left: 20mm, right: 15mm, top: 15mm, bottom: 10mm))
#set text(font: "CMU Bright", size: 10pt, lang: "en", hyphenate: false)
#set par(justify: true, leading: 0.55em, spacing: 1.2em)
#set grid(column-gutter: 1.2em, row-gutter: 0.55em)
#show link: set text(fill: rgb(0, 51, 153))
#set strong(delta: 200)

#let bullet = text(size: 0.9em, fill: luma(110))[•]
#set list(marker: bullet, body-indent: 0.5em, spacing: 0.85em)

// Section heading: large regular text with a rule underneath.
#show heading.where(level: 1): it => block(
  above: 20pt, below: 10pt, width: 100%,
  inset: (bottom: 5.5pt), stroke: (bottom: 0.4pt),
  text(size: 14pt, weight: "regular", it.body),
)

// Font Awesome 5 icon by codepoint.
#let icon(code, brand: false) = text(
  font: if brand { "Font Awesome 5 Brands" } else { "Font Awesome 5 Free Solid" },
  str.from-unicode(code),
)

// Entry: bold title with the date on the right, followed by details.
#let entry(title, date, body) = block(below: 1.6em)[
  #block(below: 0.9em, grid(columns: (1fr, auto), title, text(fill: luma(90), date)))
  #body
]

// Unbulleted line aligned with the bullet text.
#let note(body) = context block(above: 0.85em, pad(left: measure(bullet).width + 0.5em, body))

// --- Variant -----------------------------------------------------------------
//
// One source, several CVs. Pick the variant at build time:
//   typst compile --input variant=finance cv.typ cv-finance.pdf
// `general` (default): full-stack profile, ML background shown in full.
// `finance`: backend / financial-systems focus; correctness and consistency
//            first, ML background condensed.

#let variant = sys.inputs.at("variant", default: "general")
#assert(variant in ("general", "finance"), message: "unknown variant: " + variant)
#let finance = variant == "finance"

// Choose content by variant: #pick[general][finance]
#let pick(general, fin) = if finance { fin } else { general }

// --- Header ------------------------------------------------------------------

#let contacts = (
  link("https://linkedin.com/in/david-hoffmann-b7b51b228")[#icon(0xf08c, brand: true) David Hoffmann],
  link("https://github.com/d-s-hoffmann")[#icon(0xf09b, brand: true) d-s-hoffmann],
  link("mailto:d.hoffmann@protonmail.com")[#icon(0xf0e0) d.hoffmann\@protonmail.com],
  link("tel:+4917634503004")[#icon(0xf10b) +49 176 34503004],
)

#align(center, stack(
  spacing: 1.1em,
  text(size: 25pt)[David Sebastian Hoffmann],
  text(size: 12pt, pick[Team Lead · Full-Stack Software Engineer · Go · Distributed financial systems][Team Lead · Backend-focused Software Engineer · Go · Financial data consistency]),
  contacts.join[#h(0.8em)|#h(0.8em)],
  text(fill: luma(90))[#icon(0xf3c5) Based in Lisbon, Portugal · open to relocation and remote roles],
))

// --- Content -----------------------------------------------------------------

= Summary

#pick[
  Team Lead and full-stack software engineer with 3+ years building business-critical financial systems in Go and TypeScript. As a hands-on lead of four engineers, I own around 20 invoice-processing services in 30+ countries for one of Europe's largest grocery chains, from architecture and code to production reliability. Cut alert and error volume by roughly 75% and led the consolidation of distributed Oracle SQL tables into a unified MongoDB document model. Background in deep learning (M.Sc. TU Berlin, grade 1.0; IEEE publication).
][
  Team Lead and software engineer with 3+ years building financial systems in Go where correctness is critical: invoices, credit notes and reconciliation for one of Europe's largest grocery chains, in 30+ countries. Hands-on lead of four engineers owning around 20 services, fully monitored with no data loss in production. Built a distributed lock for consistent multi-entity updates, consolidated distributed Oracle SQL tables into a unified MongoDB model and cut alert and error volume by roughly 75%. M.Sc. Computer Science, TU Berlin (grade 1.0).
]

= Work Experience

// Bullets for the current role; each variant orders them differently.
#let lead = [Hands-on lead of a team of four engineers: own technical direction and final decisions, prioritise the backlog, plan implementation, align international stakeholders, mentor engineers and conduct performance reviews.]
#let services = [Own around 20 high-volume, business-critical services for invoice processing, credit notes and difference reconciliation, deployed across 30+ countries in a distributed warehouse management platform.]
#let consolidation = [Led the consolidation of large, distributed Oracle SQL tables into a unified MongoDB document model for distributed processing, giving all consumers a standardised and simpler interface.]
#let locking = [Built a database-backed distributed lock that keeps concurrent updates to multiple entities of a financial data structure consistent, in a long-running process that must not fail, with precisely tuned retries.]
#let reliability = pick[Reduced alert and error volume by roughly 75% as owner of alerting, incident response and bug fixing; full monitoring of every team-owned service, with no data loss in production.][Full monitoring of every team-owned service with no data loss in production; reduced alert and error volume by roughly 75% as owner of alerting, incident response and bug fixing.]
#let testing = [Ensure every endpoint is covered by integration tests; plan, oversee and implement system tests for all critical business logic and UIs, giving high confidence in the correctness of every change.]

#entry[Team Lead, Full-Stack Software Engineering at *freiheit.com technologies*][April 2026 – present][
  #text(fill: luma(90))[Software Engineer, June 2023 – March 2026 · promoted to Team Lead]
  #list(..pick(
    (lead, services, consolidation, locking, reliability, testing),
    (lead, services, locking, reliability, consolidation, testing),
  ))
  #note[Technologies: #pick[Go, TypeScript, Vue.js, gRPC, Oracle SQL, MongoDB, Kubernetes, Azure, Cypress][Go, gRPC, Oracle SQL, MongoDB, Kubernetes, Azure, TypeScript, Vue.js, Cypress]]
]

#entry[Student Software Developer at *NAVASTO GmbH*][Oct 2021 – April 2023][
  - Trained, validated and integrated PyTorch models into a deep learning platform for AI-driven engineering design.
  #note[Technologies: Python, PyTorch, NumPy, CUDA, Git]
]

= Education

#entry[M.Sc. in Computer Science at *TU Berlin* · Final grade 1.0 (best possible)][2020 – 2023][
  - Thesis on multi-modal vision transformers for remote sensing image classification, published at IEEE IGARSS 2023#pick[][ (#link("https://doi.org/10.1109/IGARSS52108.2023.10281927")[DOI])]
]

#entry[B.Sc. in Computer Science at *TU Berlin*][2016 – 2020][]

// The finance variant folds the publication into the thesis line above.
#if not finance [
= Publications

#entry[_Transformer-Based Multi-Modal Learning for Multi-Label Remote Sensing Image Classification_][2023][
  *D. S. Hoffmann*, K. N. Clasen, B. Demir \
  _IEEE IGARSS 2023_, pp.~4891–4894 · #link("https://doi.org/10.1109/IGARSS52108.2023.10281927")[doi.org/10.1109/IGARSS52108.2023.10281927]
]
]

= Skills

#grid(
  columns: (auto, 1fr),
  [Programming:], [Go, TypeScript (Vue.js), Python, SQL, C],
  [Backend & Infra:], [gRPC, Oracle SQL, PostgreSQL, MongoDB, Docker, Kubernetes, Terraform, Azure, Git],
  ..pick(
    ([Machine Learning:], [PyTorch, NumPy, CUDA, Computer Vision, Remote Sensing],
     [Practices:], [Microservices, distributed locking, integration & system testing, CI/CD, incident response, AI coding agents]),
    ([Practices:], [Data consistency, distributed locking, data migration, integration & system testing, monitoring, incident response, CI/CD, AI coding agents],
     [Machine Learning:], [PyTorch, Computer Vision (M.Sc. focus)]),
  ),
  [Languages:], [German (native), English (fluent), Portuguese (basic)],
)
