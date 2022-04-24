// by nota

//com.sulake.habbo.room.object.logic.furniture._SafeStr_3152

package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.room.events.RoomObjectWidgetRequestEvent;

    public class _SafeStr_3152 extends FurnitureMultiStateLogic 
    {


        override public function get contextMenu():String
        {
            return ("EFFECT_BOX");
        }

        override public function getEventTypes():Array
        {
            return (getAllEventTypes(super.getEventTypes(), ["ROWRE_EFFECTBOX_OPEN_DIALOG"]));
        }

        override public function useObject():void
        {
            var _local_1:* = null;
            if (((!(eventDispatcher == null)) && (!(object == null))))
            {
                _local_1 = new RoomObjectWidgetRequestEvent("ROWRE_EFFECTBOX_OPEN_DIALOG", object);
                eventDispatcher.dispatchEvent(_local_1);
            };
        }


    }
}//package com.sulake.habbo.room.object.logic.furniture

// _SafeStr_3152 = "_-a1M" (String#17290, DoABC#4)


