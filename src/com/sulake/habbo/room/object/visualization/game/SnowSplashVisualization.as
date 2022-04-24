// by nota

//com.sulake.habbo.room.object.visualization.game.SnowSplashVisualization

package com.sulake.habbo.room.object.visualization.game
{
    import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
    import com.sulake.habbo.room.object.visualization.furniture._SafeStr_3231;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.room.utils.IRoomGeometry;

    public class SnowSplashVisualization extends RoomObjectSpriteVisualization 
    {

        private static const FRAME_ASSET_NAMES:Array = ["snowball_splash_1", "snowball_splash_2", "snowball_splash_3"];

        private var _frameNumber:int = 0;
        private var _SafeStr_3740:_SafeStr_3231;


        public function get isDone():Boolean
        {
            return (!(_frameNumber < FRAME_ASSET_NAMES.length));
        }

        override public function initialize(_arg_1:IRoomObjectVisualizationData):Boolean
        {
            var _local_2:* = null;
            _SafeStr_3740 = (_arg_1 as _SafeStr_3231);
            createSprites(1);
            _local_2 = (_SafeStr_3740.assets.getAssetByName(FRAME_ASSET_NAMES[_frameNumber]) as BitmapDataAsset);
            getSprite(0).asset = (_local_2.content as BitmapData);
            return (true);
        }

        override public function update(_arg_1:IRoomGeometry, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean):void
        {
            _frameNumber++;
            getSprite(0).asset = ((isDone) ? null : (_SafeStr_3740.assets.getAssetByName(FRAME_ASSET_NAMES[_frameNumber]).content as BitmapData));
        }


    }
}//package com.sulake.habbo.room.object.visualization.game

// _SafeStr_3231 = "_-jR" (String#7286, DoABC#4)
// _SafeStr_3740 = "_-vf" (String#93, DoABC#4)


