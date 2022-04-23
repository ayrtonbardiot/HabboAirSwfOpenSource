// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.logic.furniture.FurnitureMysteryTrophyLogic

package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.room.events.RoomObjectWidgetRequestEvent;

    public class FurnitureMysteryTrophyLogic extends FurnitureMultiStateLogic 
    {


        override public function get contextMenu():String
        {
            return ("MYSTERY_TROPHY");
        }

        override public function getEventTypes():Array
        {
            return (getAllEventTypes(super.getEventTypes(), ["ROWRE_MYSTERYTROPHY_OPEN_DIALOG"]));
        }

        override public function useObject():void
        {
            var _local_1:* = null;
            if (((!(eventDispatcher == null)) && (!(object == null))))
            {
                _local_1 = new RoomObjectWidgetRequestEvent("ROWRE_MYSTERYTROPHY_OPEN_DIALOG", object);
                eventDispatcher.dispatchEvent(_local_1);
            };
        }


    }
}//package com.sulake.habbo.room.object.logic.furniture

