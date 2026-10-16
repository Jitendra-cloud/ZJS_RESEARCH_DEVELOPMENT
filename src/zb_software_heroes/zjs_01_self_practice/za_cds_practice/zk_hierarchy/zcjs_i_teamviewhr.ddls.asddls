@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Team Hierarchy'
define hierarchy ZCJS_I_TeamViewHR
  as parent child hierarchy(
    source ZCJS_I_TeamView
    child to parent association _Leader
    start where
      TeamLeader is initial
    siblings order by
      UserIdentification ascending
  )
{
  key UserIdentification,
      TeamLeader,
      $node.hierarchy_is_cycle    as NodeCycle,
      $node.hierarchy_is_orphan   as NodeOrphan,
      $node.hierarchy_level       as NodeLevel,
      $node.hierarchy_parent_rank as NodeParentRank,
      $node.hierarchy_rank        as NodeRank,
      $node.hierarchy_tree_size   as NodeTreeSize,
      $node.node_id               as NodeID,
      $node.parent_id             as NodeParentID

}
