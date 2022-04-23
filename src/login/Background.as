// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//login.Background

package login
{
    import flash.display.Sprite;
    import com.sulake.core.runtime._SafeStr_13;
    import flash.display.BitmapData;
    import flash.events.Event;
    import flash.display.Bitmap;
    import flash.geom.Matrix;

    public class Background extends Sprite implements _SafeStr_13 
    {

        private static const background_tiles_png:Class = hitchTile_png$0897bac54ab480d65a3527a58c0e093e188379733;

        private var _backgroundImage:BitmapData;
        private var _SafeStr_4036:Boolean;
        private var _SafeStr_9218:Sprite;

        public function Background()
        {
            addEventListener("addedToStage", onAddedToStage);
            addEventListener("removedFromStage", onRemovedFromStage);
        }

        public function dispose():void
        {
            _SafeStr_4036 = true;
            while (numChildren > 0)
            {
                removeChildAt(0);
            };
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        private function onRemovedFromStage(_arg_1:Event):void
        {
        }

        protected function onAddedToStage(_arg_1:Event):void
        {
            _SafeStr_9218 = new Sprite();
            var _local_2:Bitmap = new background_tiles_png();
            _backgroundImage = _local_2.bitmapData;
            addChild(_SafeStr_9218);
            resize();
        }

        protected function stageChangeResize(_arg_1:Event):void
        {
            resize();
        }

        public function resize():void
        {
            var _local_2:* = null;
            var _local_5:* = null;
            var _local_3:* = null;
            var _local_4:* = null;
            var _local_1:* = null;
            var _local_6:* = null;
            if (stage)
            {
                _local_2 = "linear";
                _local_5 = [809599, 801381];
                _local_3 = [1, 1];
                _local_4 = [127, 0xFF];
                _local_1 = new Matrix();
                _local_1.createGradientBox(50, 100, 0, 0, 0);
                _local_1.rotate((3.14159265358979 / 2));
                _local_1.scale((stage.stageWidth / 50), (stage.stageHeight / 100));
                _local_6 = "pad";
                graphics.beginGradientFill(_local_2, _local_5, _local_3, _local_4, _local_1, _local_6);
                graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
                if (_SafeStr_9218 != null)
                {
                    _SafeStr_9218.graphics.clear();
                    _SafeStr_9218.graphics.beginBitmapFill(_backgroundImage);
                    _SafeStr_9218.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
                    _SafeStr_9218.graphics.endFill();
                };
            };
        }


    }
}//package login

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_4036 = "_-Mr" (String#8042, DoABC#3)
// _SafeStr_9218 = "_-Z1P" (String#8897, DoABC#3)


