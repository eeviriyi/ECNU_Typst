#let project(
  title: "",
  abstract: [],
  authors: (),
  date: none,
  body,
) = {
  // Set paper fonts
  set text(font: ("Times New Roman", "Source Han Serif VF"), lang: "zh", region: "cn")

  // Configure the page.
  set page(
    // Set paper size
    paper: "a4",
    // Set paper margins
    margin: (x: 0.75in, top: 1in, bottom: 1.25in),
    // Set paper numbering
    numbering: "1",
    number-align: center
  )

  // Set the document's basic properties.
  set document(author: authors.map(a => a.name), title: title)

  // Title row.
  align(center)[
    #block(text(weight: 700, 1.75em, title))
    #v(1em, weak: true)
  ]

  // Author information.
  pad(
    top: 0.5em,
    x: 2em,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(center)[
        #author.name，
        #author.affiliation
      ]),
    ),
  )

  // Abstract.
  pad(
    x: 0em,
    top: 1em,
    bottom: 1.1em,
    align(left)[
      *摘要*
      #abstract
    ],
  )

  // Main body.
  set par(justify: true)
  show: columns.with(2, gutter: 1.3em)

  body
}