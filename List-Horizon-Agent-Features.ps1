<#
.SYNOPSIS
Script to List the VMware Horizon Agent Features Installed
	
.NOTES
  Version:        1.0
  Author:         Chris Halstead - chalstead@vmware.com
  Creation Date:  6/25/2021
  Purpose/Change: Initial Script

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
  VMWARE,INC. BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  
 #>

 write-host("**********************************************")
 write-host("Show Locally Installed Horizon Agent Features")
 write-host("Local = Installed   Absent = Not Installed")
 write-host("**********************************************")
 
 Push-Location

 $regkey = 'HKLM:\SOFTWARE\VMware, Inc.\Installer\Features_HorizonAgent' 

 Set-Location -Path $regkey

 Get-Item . |

 Select-Object -ExpandProperty property |

 ForEach-Object {

 New-Object psobject -Property @{'Feature'=$_;'Install Status' = (Get-ItemProperty -Path . -Name $_).$_}}
 
 Format-Table property, value -AutoSize

 Pop-Location
