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
         apiApp = container "API Application" "Provides funcitonality via a JSON/HTTPS API" "TypeScript and Nest.js"{
            singlePagAppRemo -> this "Makes API calls to" "JSON/HTTPS"
            singlePagAppCont -> this "Makes API calls to" "JSON/HTTPS"
            singlePageAppAnon -> this "Makes API calls to" "JSON/HTTPS"
            
            identityAccess = component "Identity and Access Context" "Allows users to sign in to their accounts in the reStyle system"{
            singlePagAppRemo -> this "Makes API calls to"
            singlePagAppCont -> this "Makes API calls to"
            singlePageAppAnon -> this "Makes API calls to"
            }
            contractorResearch = component "Contractor Research Context" "Provides customers with remodelers information and projects"{
            singlePagAppCont -> this "Makes API calls to"
            singlePageAppAnon -> this "Makes API calls to"
            }
            appointment = component "Appointment Context""Provides users with appointment management and scheduling"{
            singlePagAppRemo -> this "Makes API calls to"  
            singlePagAppCont -> this "Makes API calls to"
            }
            projectElicitation = component "Project Elicitation Context" "provides project requirements"{
            singlePagAppRemo -> this "Makes API calls to"
            singlePagAppCont -> this "Makes API calls to"
            }
            analisys = component "Analysis Context""Provides users with an overview of the organization and management of project requirements"{
            projectElicitation -> this "Send Information"
            }
            proposal = component "Proposal Context" "Provides users with quote creation"{
            analisys -> this "Send Information"
            }
            projectManagment = component "Project Management Context" "Provides users with project management and organization"{
            singlePagAppRemo -> this "Makes API calls to"
            singlePagAppCont -> this "Makes API calls to"
            }
            review = component "Reviews and Feedback Context" "Provides users with review management"{
            singlePagAppRemo -> this "Makes API calls to"
            singlePagAppCont -> this "Makes API calls to" "JSON/HTTPS"
            }
            
        }
        
        databaseUsers = container "Users Database" "Stores users registration information, access logs, etc" "MySQL "{
            apiApp -> this "Reads from and writes to" "SQL"
            identityAccess -> this "Reads from and writes to" "SQL"
            
        }
        
        databaseProjects = container "Projects Database" "Stores project registration information, project modification, etc""MySQL"{
            apiApp -> this "Reads from and writes to" "SQL"
            appointment -> this "Reads from and writes to" "SQL"
            projectManagment -> this "Reads from and writes to" "SQL"
            proposal -> this "Reads from and writes to" "SQL"
            review -> this "Reads from and writes to" "SQL"
        }
    }
        
        mainframe = softwareSystem "Mainframe Remodeling System" "Stores all of the core business information about customers, contracts, accounts, transactions, etc"{
            softwareSystem -> this "Gets account information from, and makes contracts using"
            contractorResearch -> this "Makes API calls to" "HTTPS"
            apiApp -> this "Makes API calls to" "HTTPS"
        }
        gmail = softwareSystem "Gmail" "The internal Google e-mail system"{
            apiApp -> this "Gets user information"
        }
        Stripe = softwareSystem "Stripe" "Software and APIs to accept payments and perform transactions online"{
            softwareSystem -> this "Allows users to perform payments for a subscription plan"
            identityAccess -> this "Makes API calls to" "HTTPS"
        }
        maps = softwareSystem "Google Maps" "Google's online mapping service for navigation and location information"{
            apiApp -> this "Allows users to perform searches by geolocation"
            contractorResearch -> this "Makes API calls to" "HTTPS"
        }
    }

views {
       systemContext softwareSystem {
            include *
            autolayout tb
        }
        container softwareSystem {
            include *
            autolayout tb
        }
        component apiApp {
            include *  
           
        }
        component webApp {
            include *  
           autolayout tb
        }
        theme default
        
    }

}