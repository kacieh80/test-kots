---
name: New Production Install
about: Document a new target install scenario for a single end user
title: 'New Installation: [CUSTOMER]'
labels: kind::customer
assignees: ''
---

### Intro, use case, impact & value, and target go-live date
<!-- Describe the customer and their use case or value prop. If possible, add any notes on the priority / strategic impact of getting this customer successfully up and running. -->

### Definition of Success
<!-- Define what "success" looks like for this end user, beyond just "getting the software up and running."  Example: we would like to have the customer up and running using our application within 2 weeks of target install time with 10 engineers enabled on the system -->

### Team

- [ ] Vendor Technical Leads: 
- [ ] Vendor Business Leads:
- [ ] Replicated Technical Leads:
- [ ] Replicated Business Leads:

### Timeline and Next Steps
<!-- Area to Track past engagements as well as next steps. Examples:

- 10/20 Customer identified as potential prospect, PoC kick off scheduled for 10/29
- 10/27 Pre-Planning call with Replicated team, task list reviewed and validated
- 10/29 Initial installation call, app up and running but ran out of disk space and fell over. Replicated team recommends resolving issue [#10 -- preflight checks for disk space]() before next attempt.
- 11/01 Customer working to provision new machine with bigger disk, next attempt 11/3
 -->

### Environment
<!-- Describe the customer’s environment-->

**Install type:**
<!-- Is this an Embedded or Existing Cluster? -->

**Airgap:**
<!-- Is this an Airgapped and/or BYO Registry installation? -->

**Registry:**
<!-- Does this customer require the use of 

**Operating System** (if embedded cluster):
<!-- Red Hat, Centos, Ubuntu, etc -->

**Cluster Topology** (if embedded cluster):
<!-- How many nodes are used, in what roles? Is this a Highly Available (HA) Kubernetes installation? -->

**Cluster Flavor** (if existing cluster):
<!-- Amazon EKS, Openshift, Tanzu, kops, etc -->

**Ingress Strategy:**
<!-- How will the end user interact with the application and with the app manager UI? Will there be a load balancer in front of a VM? Do they have an existing ingress or service mesh controller that must be used? Do any services require Node Ports? -->

**Storage:**
<!-- Does this customer require special considerations for planning storage?  For instance, are they going to provision separate partitions for /var, /var/lib/docker, /var/lib/containerd, /var/lib/kubelet, etc.  or do they plan to use a single large partition?   How much space will be available?  What process is required to get additional storage if that is required?  -->

**Datacenter:**
<!-- Is this AWS? Bare Metal? VSphere? GCP? Azure? Something else? -->

**Additional Details:**
<!-- Optional: Any other details of note -->


### Additional Tasks Required to Prepare for this installation
<!-- Can include integration work from Packaging board, testing work, documentation work, planning calls or anything else

Examples:
- [ ] Additional Discovery session required to get details of Storage:
- [ ] Schedule Installation Date: 
- [ ] Schedule pre-install huddle with Replicated CS team and Replicated Engineering Support
- [ ] … etc
-->
