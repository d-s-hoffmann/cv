#set page(paper: "a4")
#set heading(numbering: "1.")
#set math.equation(numbering: "(1)")

/* \newcolumntype */

  /* \newlength */

/* \titleformat *//* \titlerule */ /* \titlespacing */

     /* \bibitemsep */

/* \pagestyle */empty

 #table(
    columns: (auto),
    align: (left),
    [David Sebastian Hoffmann],
    [#v(0pt)
#link("https://linkedin.com/in/david-hoffmann-b7b51b228")[\raisebox-0.05\height\faLinkedin \ David Hoffmann] /* \ */ $|$ /* \ */
#link("mailto:d.hoffmann@protonmail.com")[\raisebox-0.05\height\faEnvelope \ `d.hoffmann@protonmail.com`] /* \ */ $|$ /* \ */  #link("tel:+4917634503004")[\raisebox-0.05\height\faMobile \ +4917634503004]],
)

 #v(10pt)

= Summary
 Full-Stack Software Engineer with more than 3 years of experience shipping distributed solutions for large-scale, highly reliable applications. I excel in a high-stakes, high-reward environment, and am adept at delivering impactful solutions with a focus on reliability and quality. My experience in international and collaborative development on large-scale software projects allows me to tackle big challenges with a perspective of long-term planning and ensuring timely delivery.  My work prioritizes systemic quality and operational resilience, ensuring solutions not only meet user needs effectively but remain sustainable at scale. Currently applying this focus to build financial systems and warehouse operations for one of Europe's largest grocery chains. #v(10pt)

= Work Experience

 #table(
    columns: (auto, auto),
    align: (left, right),
    [*Lead Full-Stack Software Engineer at freiheit.com technologies*], [June 2023 - present],
    table.cell(colspan: 2)[#block(width: 100%)[

- $bullet$ Lead a team of software engineers building products for a distributed warehouse management platform in production across all markets of one of Europe's largest grocery chains.
- $bullet$ Architected and shipped custom full-stack solutions in Go and TypeScript powering mission-critical systems for invoice processing, credit notes, and difference reconciliation. My solutions process millions of financial documents annually at enterprise scale.
- $bullet$ Delivered multi-year, high-complexity projects on schedule while meeting stringent quality and reliability standards.
-  Technologies: Go, TypeScript, Vue.js, Azure

]],
)

 #v(10pt)

 #table(
    columns: (auto, auto),
    align: (left, right),
    [*Student Software Developer at NAVASTO GmbH*], [Oct 2021 - April 2023],
    table.cell(colspan: 2)[#block(width: 100%)[

- $bullet$ Coordinated the training, validation and integration of PyTorch models into a framework of cutting edge deep learning solutions for engineering design.
-  Technologies: Python, PyTorch, NumPy, Git, CUDA

]],
)

 #v(10pt)

= Education
 #table(
    columns: (auto, auto),
    align: (left, left),
    [2020 - 2023], [M.Sc. in Computer Science at *TU Berlin*],
    [], [#block(width: 100%)[

- $bullet$ Master Thesis on Multi-Modal Vision Transformers for Multi-Label Remote Sensing Image Classification (Grade: 1.0)

]],
    [], [],
    [2016 - 2020], [B.Sc. in Computer Science at *TU Berlin*],
)
 #v(10pt)

= Publications
 /* Begin refsection */
[citations.bib] \* [heading=none]
/* End refsection */
 #v(10pt)

= Skills
 #table(
    columns: (auto, auto),
    align: (left, left),
    [Programming Languages:], [Go, Typescript, Python, C],
    [Tools:], [GRPC, Azure, Vue.js, PyTorch, Linux, Git],
    [Skills:], [Micro-service architectures, CI/CD, Machine Learning, Remote Sensing],
    [Soft Skills:], [Independent Problem Solving, Collaborative Development, Enthusiastic Learner, Critical Analysis, Reliable Maintainer],
    [Languages:], [English(fluent), German(native), Portuguese(basic level)],
)

// Conversion warnings:
// - External bibliography (`\bibliography`/`\addbibresource`) is not converted: no `#bibliography(...)` is emitted, so the reference list is missing and any `#cite(...)` will fail to compile. Add a Typst `#bibliography("refs.bib")` manually.
