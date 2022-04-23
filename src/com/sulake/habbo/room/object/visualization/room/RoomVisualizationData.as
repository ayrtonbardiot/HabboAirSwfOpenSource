// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.visualization.room.RoomVisualizationData

package com.sulake.habbo.room.object.visualization.room
{
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallRasterizer;
    import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.FloorRasterizer;
    import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallAdRasterizer;
    import com.sulake.habbo.room.object.visualization.room.rasterizer.animated.LandscapeRasterizer;
    import com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager;
    import com.sulake.habbo.room.object.visualization.room.rasterizer._SafeStr_3359;
    import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;

    public class RoomVisualizationData implements IRoomObjectVisualizationData 
    {

        private var _SafeStr_4773:WallRasterizer;
        private var _SafeStr_4772:FloorRasterizer;
        private var _SafeStr_4774:WallAdRasterizer;
        private var _SafeStr_4775:LandscapeRasterizer;
        private var _SafeStr_4776:PlaneMaskManager;
        private var _SafeStr_3853:Boolean = false;

        public function RoomVisualizationData()
        {
            _SafeStr_4773 = new WallRasterizer();
            _SafeStr_4772 = new FloorRasterizer();
            _SafeStr_4774 = new WallAdRasterizer();
            _SafeStr_4775 = new LandscapeRasterizer();
            _SafeStr_4776 = new PlaneMaskManager();
        }

        public function get initialized():Boolean
        {
            return (_SafeStr_3853);
        }

        public function get floorRasterizer():_SafeStr_3359
        {
            return (_SafeStr_4772);
        }

        public function get wallRasterizer():_SafeStr_3359
        {
            return (_SafeStr_4773);
        }

        public function get wallAdRasterizr():WallAdRasterizer
        {
            return (_SafeStr_4774);
        }

        public function get landscapeRasterizer():_SafeStr_3359
        {
            return (_SafeStr_4775);
        }

        public function get maskManager():PlaneMaskManager
        {
            return (_SafeStr_4776);
        }

        public function dispose():void
        {
            if (_SafeStr_4773 != null)
            {
                _SafeStr_4773.dispose();
                _SafeStr_4773 = null;
            };
            if (_SafeStr_4772 != null)
            {
                _SafeStr_4772.dispose();
                _SafeStr_4772 = null;
            };
            if (_SafeStr_4774 != null)
            {
                _SafeStr_4774.dispose();
                _SafeStr_4774 = null;
            };
            if (_SafeStr_4775 != null)
            {
                _SafeStr_4775.dispose();
                _SafeStr_4775 = null;
            };
            if (_SafeStr_4776 != null)
            {
                _SafeStr_4776.dispose();
                _SafeStr_4776 = null;
            };
        }

        public function clearCache():void
        {
            if (_SafeStr_4773 != null)
            {
                _SafeStr_4773.clearCache();
            };
            if (_SafeStr_4772 != null)
            {
                _SafeStr_4772.clearCache();
            };
            if (_SafeStr_4775 != null)
            {
                _SafeStr_4775.clearCache();
            };
        }

        public function initialize(_arg_1:XML):Boolean
        {
            var _local_4:* = null;
            var _local_3:* = null;
            var _local_7:* = null;
            var _local_11:* = null;
            var _local_6:* = null;
            reset();
            if (_arg_1 == null)
            {
                return (false);
            };
            var _local_5:XMLList = _arg_1.wallData;
            if (_local_5.length() > 0)
            {
                _local_4 = _local_5[0];
                _SafeStr_4773.initialize(_local_4);
            };
            var _local_2:XMLList = _arg_1.floorData;
            if (_local_2.length() > 0)
            {
                _local_3 = _local_2[0];
                _SafeStr_4772.initialize(_local_3);
            };
            var _local_10:XMLList = _arg_1.wallAdData;
            if (_local_10.length() > 0)
            {
                _local_7 = _local_10[0];
                _SafeStr_4774.initialize(_local_7);
            };
            var _local_8:XMLList = _arg_1.landscapeData;
            if (_local_8.length() > 0)
            {
                _local_11 = _local_8[0];
                _SafeStr_4775.initialize(_local_11);
            };
            var _local_9:XMLList = _arg_1.maskData;
            if (_local_9.length() > 0)
            {
                _local_6 = _local_9[0];
                _SafeStr_4776.initialize(_local_6);
            };
            return (true);
        }

        public function initializeAssetCollection(_arg_1:IGraphicAssetCollection):void
        {
            if (_SafeStr_3853)
            {
                return;
            };
            _SafeStr_4773.initializeAssetCollection(_arg_1);
            _SafeStr_4772.initializeAssetCollection(_arg_1);
            _SafeStr_4774.initializeAssetCollection(_arg_1);
            _SafeStr_4775.initializeAssetCollection(_arg_1);
            _SafeStr_4776.initializeAssetCollection(_arg_1);
            _SafeStr_3853 = true;
        }

        protected function reset():void
        {
        }


    }
}//package com.sulake.habbo.room.object.visualization.room

// _SafeStr_3359 = "_-Cj" (String#8383, DoABC#4)
// _SafeStr_3853 = "_-T1w" (String#2104, DoABC#4)
// _SafeStr_4772 = "_-Q1Z" (String#6046, DoABC#4)
// _SafeStr_4773 = "_-F1Q" (String#6156, DoABC#4)
// _SafeStr_4774 = "_-z1F" (String#7833, DoABC#4)
// _SafeStr_4775 = "_-f10" (String#6342, DoABC#4)
// _SafeStr_4776 = "_-v19" (String#4831, DoABC#4)


