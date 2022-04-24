// by nota

//com.sulake.habbo.session.events.PerksUpdatedEvent

package com.sulake.habbo.session.events
{
    import flash.events.Event;

    public class PerksUpdatedEvent extends Event 
    {

        public static const PERKS_UPDATED:String = "PUE_perks_updated";

        public function PerksUpdatedEvent()
        {
            super("PUE_perks_updated");
        }

    }
}//package com.sulake.habbo.session.events

