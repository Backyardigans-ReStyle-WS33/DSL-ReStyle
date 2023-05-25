workspace {

   model {
        remoUser = person "Remodeler User" "A remodeler individual or business with an account created in the system"
        contUser = person "Contracting User" "A customer owner of a property with an account created in the system"
        anonUser = person "Anonymous User" "Anybody on the web that visits reStyle.com"
        softwareSystem = softwareSystem "Internet Remodeling System" "Allows homeowners to connect with professionals for their remodeling projects " {
        singlePagAppRemo = container "Single-Page Application Remodeler" "Provides the functionality to remodeler users features via their web browser" "JavaScript"{
            remoUser -> this "Upload portfolio, design a remodelation project"
        }
        singlePagAppCont = container "Single-Page Application Contracting User" "Provides the functionality to contracting users features via their web browser" "JavaScript"{
            contUser -> this "Review and hire remodelers, live tracking of remodelation project"
        }
        singlePageAppAnon = container "Single-Page Application Anonymous User" "Provides functionality to anonymous user features via their web browser"{
            anonUser -> this "Visitors are allowed to access anonymous user level features"
        }
        webApp = container "Web Application" "Delivers the static content and the reStyle single page application" "TypeScript and Node.js"{
            remoUser -> this "Visits reStyle.com [HTTPS]"
            contUser -> this "Visits reStyle.com [HTTPS]"
            singlePagAppRemo -> this "Delivers to the customer's web browser"
            singlePagAppCont -> this "Delivers to the customer's web browser"
            singlePageAppAnon -> this "Delivers to the visitor's web browser"
            
            singlePagAppRemo -> this "Makes API calls to" "JSON/HTTPS"
            singlePagAppCont -> this "Makes API calls to" "JSON/HTTPS"
            singlePageAppAnon -> this "Makes API calls to" "JSON/HTTPS"
            
            identityAccess1 = component "Identity and Access Context" "Allows users to sign in to their accounts in the reStyle system"{
            singlePagAppRemo -> this "Makes web calls to"
            singlePagAppCont -> this "Makes web calls to"
            singlePageAppAnon -> this "Makes web calls to"
            }
            contractorResearch1 = component "Contractor Research Context" "Provides customers with remodelers information and projects"{
            singlePagAppCont -> this "Makes web calls to"
            singlePageAppAnon -> this "Makes web calls to"
            }
            appointment1 = component "Appointment Context""Provides users with appointment management and scheduling"{
            singlePagAppRemo -> this "Makes web calls to"  
            singlePagAppCont -> this "Makes web calls to"
            }
            projectElicitation1 = component "Project Elicitation Context" "provides project requirements"{
            singlePagAppCont -> this "Makes web calls to"
            }
            analisys1 = component "Analysis Context""Provides users with an overview of the organization and management of project requirements"{
            singlePagAppRemo -> this "Makes web calls to"
            }
            proposal1 = component "Proposal Context" "Provides users with quote creation"{
            singlePagAppRemo -> this "Makes web calls to"  
            singlePagAppCont -> this "Makes web calls to"
            }
            projectManagment1 = component "Project Management Context" "Provides users with project management and organization"{
            singlePagAppRemo -> this "Makes web calls to"
            singlePagAppCont -> this "Makes web calls to"
            }
            review1 = component "Reviews and Feedback Context" "Provides users with review management"{
            singlePagAppRemo -> this "Makes web calls to"
            singlePagAppCont -> this "Makes web calls to"
            }
        }
        

}