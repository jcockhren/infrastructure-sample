# Infrastructure Sample

This contains an examples:

- Data-driven infrastructure using Saltstack
- using Saltstack with Packer to create an AMI for on-demand jenkins nodes
- custom Saltstack states
- use of Saltstack formulas

### Description of Key Elements

Consider the following directories:

- `salt/forumlas` - a collection of saltstack formulas includes as submodules
- `salt/pillar` - data that drives the infrastructure. Usually included as a submodule
- `salt/states` - states with a special top file for using data to dynamic determine states to call on a node. usually included as a submodule
- `packer/jenkins` - example of using infrastructure code to enable easy creation of jenkins nodes using Packer (w/ salt provisioning)


## Roles and Environments

**Environments** - subsets of your infrastructure. The subsets may overlap. (different from 'salt environments)

**Roles** - a mapping between the act of provisioning a node to the assigned _duty_ of a node inside the infrastructure. (ex. nodes to be provisioned with database may be assigned a 'postgres' role)

`salt/pillar/envs` - collections of environments

`salt/pillar/roles` - collections of roles

### How Roles and Environments Work Together

Assigning a role to node basically says, "Hey saltstack, could you provision this node with a state that matches this duty?"

Saltstack then goes, "ok, will do. But hey, your state requires some data..."

This is where environments come in. Environments define the data to be used in the state relative to the context of usage of a specific role/duty. For example, contrast configurating postgresql for use in production with configuring postgresql for use in CI/CD. The _role_ of two nodes may be the same but the _role_ will be configured differently.

As one may expect in practice, nodes may be assigned multiple roles. For example, a node that has a role for your web application and a role for installing & configuring nginx. This also means a node can use data from multiple environments.


### How to assign a role to a node

One uses Saltstack built-in mechanism for targeting pillar data in a `top.sls` file in the main pillar repo. Example: [jenkins AMI top.sls file](the://github.com/jcockhren/infrastructure-sample/blob/master/packer/jenkins/pillar/top.sls)
