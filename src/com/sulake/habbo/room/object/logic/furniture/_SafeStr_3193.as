// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.logic.furniture._SafeStr_3193

package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.room.utils._SafeStr_1675;

    public class _SafeStr_3193 extends FurnitureMultiStateLogic 
    {


        override public function initialize(_arg_1:XML):void
        {
            var _local_4:* = null;
            var _local_2:* = null;
            super.initialize(_arg_1);
            if (_arg_1 == null)
            {
                return;
            };
            var _local_3:XMLList = _arg_1.mask;
            if (_local_3.length() > 0)
            {
                _local_4 = _local_3[0];
                if (_SafeStr_1675.checkRequiredAttributes(_local_4, ["type"]))
                {
                    _local_2 = _local_4.@type;
                    object.getModelController().setNumber("furniture_uses_plane_mask", 1, true);
                    object.getModelController().setString("furniture_plane_mask_type", _local_2, true);
                };
            };
        }


    }
}//package com.sulake.habbo.room.object.logic.furniture

// _SafeStr_1675 = "_-j1M" (String#2347, DoABC#4)
// _SafeStr_3193 = "_-bn" (String#19014, DoABC#4)


