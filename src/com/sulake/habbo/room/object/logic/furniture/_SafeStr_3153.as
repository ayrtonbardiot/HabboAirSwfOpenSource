// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.logic.furniture._SafeStr_3153

package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.room.events.RoomObjectWidgetRequestEvent;

    public class _SafeStr_3153 extends FurnitureMultiStateLogic 
    {


        override public function get contextMenu():String
        {
            return ("MYSTERY_BOX");
        }

        override public function getEventTypes():Array
        {
            return (getAllEventTypes(super.getEventTypes(), ["ROWRE_MYSTERYBOX_OPEN_DIALOG"]));
        }

        override public function useObject():void
        {
            var _local_1:* = null;
            if (((!(eventDispatcher == null)) && (!(object == null))))
            {
                _local_1 = new RoomObjectWidgetRequestEvent("ROWRE_MYSTERYBOX_OPEN_DIALOG", object);
                eventDispatcher.dispatchEvent(_local_1);
            };
        }


    }
}//package com.sulake.habbo.room.object.logic.furniture

// _SafeStr_3153 = "_-zV" (String#18538, DoABC#4)


