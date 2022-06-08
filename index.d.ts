declare module 'react-native-trackier' {
    type Environment = 'development' | 'production' | 'testing'

    export class TrackierConfig{
        constructor(appToken: string, environment: Environment)
    }
 
    export class TrackierSDK {
        constructor(trackierEvent:TrackierEvent)
        initialize: (trackierConfig: TrackierConfig) => void
        trackEvent: (trackierEvent:TrackierEvent) => void

        setEnable: (trackierEnable:boolean) => void 
        setUserId: (userId: String) => void
        setUserEmail: (userEmail: String) => void
        trackOrganic: (trackAsOrganic: boolean)=> void
        session:(trackierSession: String)=> void
        localRefTrack: (localRefTrack: String) => void 
        setUserAdditionalDetails: (key:string,value:string) => void
       
    }

    export class TrackierEvent{
        constructor(eventId:string)
        setEventValue: (key:string,value:string) => void
    }
  
    
}