﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.logic.furniture.FurnitureRoomBillboardLogic

package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.room.object.IRoomObjectModelController;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.habbo.room.events.RoomObjectRoomAdEvent;

    public class FurnitureRoomBillboardLogic extends FurnitureRoomBrandingLogic 
    {

        public function FurnitureRoomBillboardLogic()
        {
            _SafeStr_4704 = true;
        }

        override protected function getAdClickUrl(_arg_1:IRoomObjectModelController):String
        {
            return (_arg_1.getString("furniture_branding_url"));
        }

        override protected function handleAdClick(_arg_1:int, _arg_2:String, _arg_3:String):void
        {
            if (_arg_3.indexOf("http") == 0)
            {
                HabboWebTools.openWebPage(_arg_3);
            }
            else
            {
                if (eventDispatcher != null)
                {
                    eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent("RORAE_ROOM_AD_FURNI_CLICK", object, "", _arg_3));
                };
            };
        }


    }
}//package com.sulake.habbo.room.object.logic.furniture

// _SafeStr_4704 = "_-JB" (String#13089, DoABC#4)


