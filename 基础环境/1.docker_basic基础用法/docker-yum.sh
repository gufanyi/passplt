#!/bin/bash
yum install yum-utils
yum-complete-transaction yum-complete-transaction –cleanup-only
package-cleanup --problems
package-cleanup --dupes
