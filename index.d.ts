declare module 'react-native-trackier' {
    type Environment = 'development' | 'production' | 'testing'

    export class TrackierConfig {
        constructor(appToken: string, environment: Environment)
    }
 
    export class TrackierSDK {
        constructor(trackierEvent:TrackierEvent)
        initialize: (trackierConfig: TrackierConfig) => void
        trackEvent: (trackierEvent: TrackierEvent) => void

        setEnabled: (value:boolean) => void 
        getTrackierId: () => Promise<string> 
        setUserId: (userId: string) => void
        setUserEmail: (userEmail: string) => void
        trackAsOrganic: (value: boolean) => void
        setLocalRefTrack: (value: boolean, delimeter: string) => void 
        setUserAdditionalDetails: (key: string, value: string) => void
    }

    export class TrackierEvent {
        constructor(eventId: string)
        setEventValue: (key: string, value: string) => void
    }
}