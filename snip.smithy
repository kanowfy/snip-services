// snip.smithy
//

// Tell the code generator how to reference symbols defined in this namespace
metadata package = [ { namespace: "org.kny.services.snip", crate: "snip_services" } ]

namespace org.kny.services.snip

use org.wasmcloud.model#wasmbus
use org.wasmcloud.model#U64

/// Description of Snip service
@wasmbus( actorReceive: true )
service Snip {
  version: "0.1",
  operations: [ GetAllSnippets, GetOneSnippet, CreateSnippet, UpdateSnippet, DeleteSnippet ]
}

operation GetAllSnippets {
  output: Snippets
}

operation GetOneSnippet {
  input: U64,
  output: GetOneSnippetResponse
}

operation CreateSnippet {
  input: CreateSnippetRequest,
  output: CreateSnippetResponse
}

operation UpdateSnippet {
  input: UpdateSnippetRequest,
  output: UpdateSnippetResponse
}

operation DeleteSnippet {
  input: U64,
  output: DeleteSnippetResponse
}

structure GetOneSnippetResponse {
  snippet: Snippet
}

structure CreateSnippetRequest {
  @required
  title: String,
  @required
  content: String,
}

structure CreateSnippetResponse {
  @required
  success: Boolean,
  id: U64
}

structure UpdateSnippetRequest {
  @required
  targetId: U64,
  title: String,
  content: String,
  published: Boolean
}

structure UpdateSnippetResponse {
  @required
  success: Boolean
}

structure DeleteSnippetResponse {
  @required
  success: Boolean
}

structure Snippet {
  @required
  id: U64,
  @required
  title: String,
  @required
  content: String,
  published: Boolean
}

list Snippets {
  member: Snippet
}
