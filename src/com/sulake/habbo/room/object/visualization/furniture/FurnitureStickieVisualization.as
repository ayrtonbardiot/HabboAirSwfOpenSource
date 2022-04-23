// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.visualization.furniture.FurnitureStickieVisualization

package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;

    public class FurnitureStickieVisualization extends FurnitureVisualization 
    {

        private var _SafeStr_3740:FurnitureVisualizationData = null;


        override public function initialize(_arg_1:IRoomObjectVisualizationData):Boolean
        {
            _SafeStr_3740 = (_arg_1 as FurnitureVisualizationData);
            return (super.initialize(_arg_1));
        }

        override protected function getSpriteColor(_arg_1:int, _arg_2:int, _arg_3:int):int
        {
            if (_SafeStr_3740 == null)
            {
                return (0xFFFFFF);
            };
            var _local_4:int = _SafeStr_3740.getColor(_arg_1, _arg_2, _arg_3);
            return (_local_4);
        }


    }
}//package com.sulake.habbo.room.object.visualization.furniture

// _SafeStr_3740 = "_-vf" (String#93, DoABC#4)


