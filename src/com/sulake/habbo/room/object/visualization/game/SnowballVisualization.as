// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.visualization.game.SnowballVisualization

package com.sulake.habbo.room.object.visualization.game
{
    import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
    import com.sulake.habbo.room.object.visualization.furniture._SafeStr_3231;
    import com.sulake.room.object.visualization.IRoomObjectSprite;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.room.utils.IRoomGeometry;

    public class SnowballVisualization extends RoomObjectSpriteVisualization 
    {

        private static const SNOWBALL_ASSET_NAME:String = "snowball_small_png";
        private static const SNOWBALL_SHADOW_ASSET_NAME:String = "snowball_small_shadow_png";
        private static const _SafeStr_8759:int = 16;

        private var _SafeStr_3740:_SafeStr_3231;
        private var _SafeStr_4388:IRoomObjectSprite;


        override public function dispose():void
        {
            _SafeStr_4388 = null;
            super.dispose();
        }

        override public function initialize(_arg_1:IRoomObjectVisualizationData):Boolean
        {
            var _local_2:* = null;
            _SafeStr_3740 = (_arg_1 as _SafeStr_3231);
            createSprites(2);
            _local_2 = (_SafeStr_3740.assets.getAssetByName("snowball_small_png") as BitmapDataAsset);
            getSprite(0).asset = (_local_2.content as BitmapData);
            _local_2 = (_SafeStr_3740.assets.getAssetByName("snowball_small_shadow_png") as BitmapDataAsset);
            _SafeStr_4388 = getSprite(1);
            _SafeStr_4388.asset = (_local_2.content as BitmapData);
            _SafeStr_4388.alpha = 100;
            _SafeStr_4388.relativeDepth = 1;
            return (true);
        }

        override public function update(_arg_1:IRoomGeometry, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean):void
        {
            _SafeStr_4388.offsetY = (object.getLocation().z * 16);
            _SafeStr_4388.alpha = Math.max(0, (100 - (_SafeStr_4388.offsetY / 10)));
        }


    }
}//package com.sulake.habbo.room.object.visualization.game

// _SafeStr_3231 = "_-jR" (String#7286, DoABC#4)
// _SafeStr_3740 = "_-vf" (String#93, DoABC#4)
// _SafeStr_4388 = "_-pI" (String#6594, DoABC#4)
// _SafeStr_8759 = "_-SK" (String#39553, DoABC#4)


