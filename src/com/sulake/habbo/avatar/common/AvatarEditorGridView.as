// by nota

//com.sulake.habbo.avatar.common.AvatarEditorGridView

package com.sulake.habbo.avatar.common
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.IScrollableGridWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events._SafeStr_3116;

    public class AvatarEditorGridView implements _SafeStr_3375 
    {

        public static const REMOVE_ITEM:String = "REMOVE_ITEM";
        public static const GET_MORE:String = "GET_MORE";

        private const MAX_COLOR_LAYERS:int = 2;

        private var _SafeStr_3882:_SafeStr_3133;
        private var _SafeStr_4619:_SafeStr_3301;
        private var _SafeStr_6401:IItemGridWindow;
        private var _SafeStr_6400:Array;
        private var _SafeStr_4674:String;
        private var _notification:_SafeStr_3109;
        private var _SafeStr_4004:_SafeStr_3109;

        public function AvatarEditorGridView(_arg_1:_SafeStr_3133)
        {
            _SafeStr_3882 = _arg_1;
            _SafeStr_6401 = (_SafeStr_3882.findChildByName("thumbs") as IItemGridWindow);
            _SafeStr_6400 = [];
            _SafeStr_6400.push((_SafeStr_3882.findChildByName("palette0") as IItemGridWindow));
            _SafeStr_6400.push((_SafeStr_3882.findChildByName("palette1") as IItemGridWindow));
            _notification = _SafeStr_3882.findChildByName("content_notification");
            _SafeStr_4004 = _SafeStr_3882.findChildByName("content_title");
            _notification.visible = false;
            _SafeStr_4004.visible = false;
        }

        public function dispose():void
        {
            if (_SafeStr_6401)
            {
                _SafeStr_6401.dispose();
                _SafeStr_6401 = null;
            };
            if (_SafeStr_6400)
            {
                for each (var _local_1:IItemGridWindow in _SafeStr_6400)
                {
                    if (_local_1 != null)
                    {
                        _local_1.dispose();
                        _local_1 = null;
                    };
                };
                _SafeStr_6400 = null;
            };
            _SafeStr_4619 = null;
            if (_SafeStr_3882)
            {
                _SafeStr_3882.dispose();
                _SafeStr_3882 = null;
            };
        }

        public function get window():_SafeStr_3133
        {
            if (_SafeStr_3882 == null)
            {
                return (null);
            };
            if (_SafeStr_3882.disposed)
            {
                return (null);
            };
            return (_SafeStr_3882);
        }

        public function initFromList(_arg_1:_SafeStr_3301, _arg_2:String):void
        {
            var _local_3:int;
            var _local_6:* = null;
            var _local_4:CategoryData = _arg_1.getCategoryData(_arg_2);
            if (!_local_4)
            {
                return;
            };
            _SafeStr_3882.visible = true;
            _SafeStr_4619 = _arg_1;
            _SafeStr_4674 = _arg_2;
            _SafeStr_6401.removeGridItems();
            if (_local_4.parts.length == 0)
            {
                _SafeStr_4004.visible = true;
                _notification.visible = true;
            }
            else
            {
                _SafeStr_4004.visible = false;
                _notification.visible = false;
                for each (var _local_8:IItemGridWindow in _SafeStr_6400)
                {
                    _local_8.removeGridItems();
                };
                for each (var _local_5:AvatarEditorGridPartItem in _local_4.parts)
                {
                    if (_local_5)
                    {
                        _SafeStr_6401.addGridItem(_local_5.view);
                        _local_5.view.addEventListener("WME_CLICK", onGridItemClicked);
                        if (_local_5.isSelected)
                        {
                            showPalettes(_local_5.colorLayerCount);
                        };
                    };
                };
                _local_3 = 0;
                while (_local_3 < 2)
                {
                    _local_6 = _local_4.getPalette(_local_3);
                    _local_8 = (_SafeStr_6400[_local_3] as IItemGridWindow);
                    if (!((!(_local_6)) || (!(_local_8))))
                    {
                        for each (var _local_7:AvatarEditorGridColorItem in _local_6)
                        {
                            _local_8.addGridItem(_local_7.view);
                            _local_7.view.procedure = paletteEventProc;
                        };
                    };
                    _local_3++;
                };
            };
        }

        public function showPalettes(_arg_1:int):void
        {
            var _local_4:IScrollableGridWindow = (_SafeStr_3882.findChildByName("palette0") as IScrollableGridWindow);
            var _local_3:IScrollableGridWindow = (_SafeStr_3882.findChildByName("palette1") as IScrollableGridWindow);
            var _local_5:int = _SafeStr_6401.width;
            var _local_2:int = int(((_SafeStr_6401.width - 10) / 2));
            if (_arg_1 <= 1)
            {
                _local_4.width = _local_5;
                _local_4.visible = true;
                _local_3.visible = false;
            }
            else
            {
                _local_4.width = _local_2;
                _local_3.width = _local_2;
                _local_3.x = (_local_4.right + 10);
                _local_4.visible = true;
                _local_3.visible = true;
            };
        }

        public function updatePart(_arg_1:int, _arg_2:_SafeStr_3133):void
        {
            var _local_3:_SafeStr_3109 = _SafeStr_6401.getGridItemAt(_arg_1);
            if (!_local_3)
            {
                return;
            };
            _local_3 = _arg_2;
        }

        private function onGridItemClicked(_arg_1:WindowMouseEvent):void
        {
            var _local_2:int;
            switch (_arg_1.target.name)
            {
                case "REMOVE_ITEM":
                    _local_2 = _SafeStr_6401.getGridItemIndex(_arg_1.window);
                    _SafeStr_4619.selectPart(_SafeStr_4674, _local_2);
                    return;
                case "GET_MORE":
                    _SafeStr_4619.controller.manager.catalog.openCatalogPage(_SafeStr_4619.controller.manager.getProperty("catalog.clothes.page"));
                    return;
                default:
                    _local_2 = _SafeStr_6401.getGridItemIndex(_arg_1.window);
                    _SafeStr_4619.selectPart(_SafeStr_4674, _local_2);
                    return;
            };
        }

        private function paletteEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_5:int;
            var _local_4:* = null;
            var _local_7:int;
            var _local_3:* = null;
            var _local_6:int;
            if (_arg_1.type == "WME_CLICK")
            {
                _local_3 = _arg_1.window;
                _local_6 = 0;
                while (_local_6 < 2)
                {
                    if (_SafeStr_6400.length > _local_6)
                    {
                        _local_4 = (_SafeStr_6400[_local_6] as IItemGridWindow);
                        _local_7 = _local_4.getGridItemIndex(_local_3);
                        if (_local_7 > -1)
                        {
                            _SafeStr_4619.selectColor(_SafeStr_4674, _local_7, _local_6);
                            return;
                        };
                    };
                    _local_6++;
                };
            };
        }


    }
}//package com.sulake.habbo.avatar.common

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3301 = "_-f1d" (String#2199, DoABC#4)
// _SafeStr_3375 = "_-n1X" (String#8106, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_4004 = "_-41o" (String#1978, DoABC#4)
// _SafeStr_4619 = "_-x1i" (String#278, DoABC#4)
// _SafeStr_4674 = "_-k10" (String#2944, DoABC#4)
// _SafeStr_6400 = "_-014" (String#5652, DoABC#4)
// _SafeStr_6401 = "_-l1o" (String#3329, DoABC#4)


