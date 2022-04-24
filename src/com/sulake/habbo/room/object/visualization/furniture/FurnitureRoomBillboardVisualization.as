// by nota

//com.sulake.habbo.room.object.visualization.furniture.FurnitureRoomBillboardVisualization

package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.room.object.IRoomObjectModel;

    public class FurnitureRoomBillboardVisualization extends FurnitureRoomBrandingVisualization 
    {


        override protected function getAdClickUrl(_arg_1:IRoomObjectModel):String
        {
            return (_arg_1.getString("furniture_branding_url"));
        }

        override protected function getSpriteXOffset(_arg_1:int, _arg_2:int, _arg_3:int):int
        {
            return (super.getSpriteXOffset(_arg_1, _arg_2, _arg_3) + _SafeStr_4296);
        }

        override protected function getSpriteYOffset(_arg_1:int, _arg_2:int, _arg_3:int):int
        {
            return (super.getSpriteYOffset(_arg_1, _arg_2, _arg_3) + _SafeStr_4297);
        }

        override protected function getSpriteZOffset(_arg_1:int, _arg_2:int, _arg_3:int):Number
        {
            return (super.getSpriteZOffset(_arg_1, _arg_2, _arg_3) + (_SafeStr_4298 * -1));
        }


    }
}//package com.sulake.habbo.room.object.visualization.furniture

// _SafeStr_4296 = "_-k15" (String#12518, DoABC#4)
// _SafeStr_4297 = "_-zM" (String#12994, DoABC#4)
// _SafeStr_4298 = "_-z17" (String#15608, DoABC#4)


