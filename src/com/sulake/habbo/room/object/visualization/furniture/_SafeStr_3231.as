// by nota

//com.sulake.habbo.room.object.visualization.furniture._SafeStr_3231

package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.core.assets.IAssetLibrary;

    public class _SafeStr_3231 implements IRoomObjectVisualizationData 
    {

        private var _assets:IAssetLibrary;


        public function dispose():void
        {
            _assets = null;
        }

        public function initialize(_arg_1:XML):Boolean
        {
            return (true);
        }

        public function set assets(_arg_1:IAssetLibrary):void
        {
            _assets = _arg_1;
        }

        public function get assets():IAssetLibrary
        {
            return (_assets);
        }


    }
}//package com.sulake.habbo.room.object.visualization.furniture

// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3231 = "_-jR" (String#7286, DoABC#4)


