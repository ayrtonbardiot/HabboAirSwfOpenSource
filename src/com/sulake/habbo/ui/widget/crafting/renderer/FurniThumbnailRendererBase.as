// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.crafting.renderer.FurniThumbnailRendererBase

package com.sulake.habbo.ui.widget.crafting.renderer
{
    import com.sulake.habbo.room._SafeStr_3140;
    import com.sulake.habbo.ui.widget.crafting.CraftingWidget;
    import com.sulake.habbo.ui.widget.crafting.utils.CraftingFurnitureItem;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.habbo.session.furniture._SafeStr_3130;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.display.BitmapData;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.events._SafeStr_3116;

    public class FurniThumbnailRendererBase implements _SafeStr_3140 
    {

        private const THUMB_BLEND_ITEMS_AVAILABLE:Number = 1;
        private const THUMB_BLEND_ITEMS_NOT_AVAILABLE:Number = 0.2;

        protected var _SafeStr_4981:CraftingWidget;
        protected var _SafeStr_3740:CraftingFurnitureItem;
        protected var _window:_SafeStr_3133;

        public function FurniThumbnailRendererBase(_arg_1:CraftingFurnitureItem, _arg_2:_SafeStr_3133, _arg_3:CraftingWidget)
        {
            _SafeStr_4981 = _arg_3;
            _window = _arg_2;
            _SafeStr_3740 = _arg_1;
            requestIconFromRoomEngine(furnitureData);
            updateItemCount();
            _window.procedure = onMouseDown;
            var _local_4:IRegionWindow = (_arg_2.findChildByName("tooltip") as IRegionWindow);
            _local_4.toolTipCaption = _arg_1.furnitureData.localizedName;
        }

        public function dispose():void
        {
            if (_window)
            {
                _window.removeEventListener("mouseDown", onMouseDown);
                _window.dispose();
                _window = null;
            };
        }

        private function requestIconFromRoomEngine(_arg_1:_SafeStr_3130):void
        {
            var _local_2:* = null;
            switch (_arg_1.type)
            {
                case "s":
                    _local_2 = _SafeStr_4981.handler.container.roomEngine.getFurnitureIcon(_arg_1.id, this);
                    break;
                case "i":
                    _local_2 = _SafeStr_4981.handler.container.roomEngine.getWallItemIcon(_arg_1.id, this);
            };
            if (_local_2.data)
            {
                imageReady(0, _local_2.data);
            };
        }

        public function imageReady(_arg_1:int, _arg_2:BitmapData):void
        {
            if (!_window)
            {
                return;
            };
            var _local_3:_SafeStr_3264 = (_window.findChildByTag("BITMAP") as _SafeStr_3264);
            if (((_local_3) && (_arg_2)))
            {
                _local_3.bitmap = _arg_2;
            };
        }

        public function imageFailed(_arg_1:int):void
        {
        }

        public function updateItemCount():void
        {
        }

        protected function hideItemCount():void
        {
            var _local_1:_SafeStr_3109 = _window.findChildByName("number_container");
            if (_local_1)
            {
                _local_1.visible = false;
            };
        }

        protected function updateGroupItemCount(_arg_1:int):void
        {
            var _local_3:* = null;
            if (((!(_window)) || (_window.disposed)))
            {
                return;
            };
            var _local_2:_SafeStr_3109 = _window.findChildByName("number_container");
            _local_2.visible = (_arg_1 > 0);
            if (_arg_1 > 0)
            {
                _local_3 = (_window.findChildByName("number") as ITextWindow);
                _local_3.text = String(_arg_1);
            };
        }

        protected function updateBitmapBlend(_arg_1:Boolean):void
        {
            var _local_2:_SafeStr_3264 = (_window.findChildByName("bitmap") as _SafeStr_3264);
            if (_arg_1)
            {
                _local_2.blend = 1;
            }
            else
            {
                _local_2.blend = 0.2;
            };
        }

        private function onMouseDown(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_DOWN")
            {
                return;
            };
            onTriggered();
        }

        protected function onTriggered():void
        {
        }

        public function get content():CraftingFurnitureItem
        {
            return (_SafeStr_3740);
        }

        protected function get furnitureData():_SafeStr_3130
        {
            return ((content) ? content.furnitureData : null);
        }

        public function get window():_SafeStr_3133
        {
            return (_window);
        }


    }
}//package com.sulake.habbo.ui.widget.crafting.renderer

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3130 = "_-fG" (String#751, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3140 = "_-Y1o" (String#1299, DoABC#4)
// _SafeStr_3248 = "_-u1i" (String#807, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3740 = "_-vf" (String#93, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)


