// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.furniture.dimmer.DimmerView

package com.sulake.habbo.ui.widget.furniture.dimmer
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.ITabContextWindow;
    import com.sulake.core.window._SafeStr_3109;
    import flash.geom.Rectangle;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import com.sulake.core.window.components._SafeStr_3158;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.components.ISelectableWindow;
    import com.sulake.core.assets.XmlAsset;

    public class DimmerView 
    {

        private static const _SafeStr_9017:Number = 100;
        private static const _SafeStr_9018:Number = 100;

        private var _window:_SafeStr_3133;
        private var _tabContext:ITabContextWindow;
        private var _windowXML:XML;
        private var _SafeStr_4981:DimmerFurniWidget;
        private var _SafeStr_5979:DimmerViewColorGrid;
        private var _SafeStr_5980:DimmerViewAlphaSlider;
        private var _SafeStr_5976:int;
        private var _SafeStr_5977:int;
        private var _SafeStr_5978:int;

        public function DimmerView(_arg_1:DimmerFurniWidget)
        {
            _SafeStr_4981 = _arg_1;
        }

        public function get selectedBrightness():int
        {
            return (_SafeStr_5976);
        }

        public function get selectedColorIndex():int
        {
            return (_SafeStr_5977);
        }

        public function get selectedType():int
        {
            return (_SafeStr_5978);
        }

        public function dispose():void
        {
            hideInterface();
            _SafeStr_4981 = null;
        }

        public function showInterface():void
        {
            if (_window == null)
            {
                createWindow();
            };
            selectPreset(_SafeStr_4981.selectedPresetIndex);
            update();
        }

        public function update():void
        {
            var _local_2:* = null;
            if (((_window == null) || (_SafeStr_4981 == null)))
            {
                return;
            };
            var _local_1:* = (_SafeStr_4981.dimmerState == 1);
            var _local_3:_SafeStr_3109 = _window.findChildByName("on_off_button");
            if (_local_3 != null)
            {
                _local_2 = ((_local_1) ? "${widget.dimmer.button.off}" : "${widget.dimmer.button.on}");
                _local_3.caption = _local_2;
            };
            _local_3 = _window.findChildByName("tabbedview");
            if (_local_3 != null)
            {
                _local_3.visible = _local_1;
            };
            _local_3 = _window.findChildByName("apply_button");
            if (_local_3 != null)
            {
                ((_local_1) ? _local_3.enable() : _local_3.disable());
            };
            _local_3 = _window.findChildByName("off_border");
            if (_local_3)
            {
                _local_3.visible = (!(_local_1));
            };
        }

        public function hideInterface():void
        {
            if (_SafeStr_4981 != null)
            {
                _SafeStr_4981.removePreview();
            };
            if (_SafeStr_5979 != null)
            {
                _SafeStr_5979.dispose();
                _SafeStr_5979 = null;
            };
            if (_SafeStr_5980 != null)
            {
                _SafeStr_5980.dispose();
                _SafeStr_5980 = null;
            };
            _tabContext = null;
            if (_window != null)
            {
                _window.dispose();
                _window = null;
            };
        }

        private function createWindow():void
        {
            var _local_4:* = null;
            var _local_5:* = null;
            var _local_6:int;
            var _local_1:* = null;
            var _local_3:* = null;
            if ((((_SafeStr_4981 == null) || (_SafeStr_4981.windowManager == null)) || (windowXML == null)))
            {
                return;
            };
            _window = (_SafeStr_4981.windowManager.createWindow("dimmerui_container", "", 4, 0, (0x020000 | 0x01), new Rectangle(100, 100, 2, 2), null, 0) as _SafeStr_3133);
            _window.buildFromXML(windowXML);
            _local_4 = _window.findChildByTag("close");
            if (_local_4 != null)
            {
                _local_4.procedure = onWindowClose;
            };
            _local_4 = _window.findChildByName("color_grid_container");
            if (_local_4 != null)
            {
                _local_5 = (_local_4 as _SafeStr_3133).findChildByName("color_grid");
                if (_local_5 != null)
                {
                    _SafeStr_5979 = new DimmerViewColorGrid(this, (_local_5 as IItemGridWindow), _SafeStr_4981.windowManager, _SafeStr_4981.assets);
                };
            };
            _local_4 = _window.findChildByName("brightness_container");
            if (_local_4 != null)
            {
                _SafeStr_5980 = new DimmerViewAlphaSlider(this, (_local_4 as _SafeStr_3133), _SafeStr_4981.assets);
            };
            _tabContext = ITabContextWindow(_window.findChildByName("tab_context"));
            selectTab(_SafeStr_4981.selectedPresetIndex);
            _local_6 = 0;
            while (_local_6 < _tabContext.numTabItems)
            {
                _local_1 = _tabContext.getTabItemAt(_local_6);
                _local_1.setParamFlag(1, true);
                _local_1.procedure = onTabClick;
                _local_6++;
            };
            _local_4 = _window.findChildByName("type_checkbox");
            if (_local_4 != null)
            {
                _local_4.addEventListener("WME_CLICK", onMouseEvent);
            };
            _local_4 = _window.findChildByName("apply_button");
            if (_local_4 != null)
            {
                _local_4.addEventListener("WME_CLICK", onMouseEvent);
            };
            _local_4 = _window.findChildByName("on_off_button");
            if (_local_4 != null)
            {
                _local_4.addEventListener("WME_CLICK", onMouseEvent);
            };
            var _local_2:_SafeStr_3264 = (_window.findChildByName("off_image") as _SafeStr_3264);
            var _local_7:BitmapDataAsset = (_SafeStr_4981.assets.getAssetByName("dimmer_info") as BitmapDataAsset);
            if (((!(_local_2 == null)) && (!(_local_7 == null))))
            {
                _local_2.bitmap = new BitmapData(_local_2.width, _local_2.height);
                _local_3 = (_local_7.content as BitmapData);
                if (_local_3 != null)
                {
                    _local_2.bitmap.copyPixels(_local_3, _local_3.rect, new Point(0, 0));
                };
            };
        }

        private function onMouseEvent(_arg_1:WindowMouseEvent):void
        {
            var _local_3:* = null;
            var _local_2:_SafeStr_3109 = (_arg_1.target as _SafeStr_3109);
            var _local_4:String = _local_2.name;
            switch (_local_4)
            {
                case "type_checkbox":
                    _local_3 = (_arg_1.target as _SafeStr_3158);
                    if (_local_3 == null)
                    {
                        return;
                    };
                    if (_local_3.isSelected)
                    {
                        selectedType = 2;
                    }
                    else
                    {
                        selectedType = 1;
                    };
                    _SafeStr_4981.previewCurrentSetting();
                    return;
                case "apply_button":
                    _SafeStr_4981.storeCurrentSetting(true);
                    return;
                case "cancel":
                case "close":
                    hideInterface();
                    return;
                case "on_off_button":
                    _SafeStr_4981.changeRoomDimmerState();
                    return;
            };
        }

        private function onTabClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WE_SELECTED")
            {
                return;
            };
            _SafeStr_4981.storeCurrentSetting(false);
            var _local_3:int = _arg_2.id;
            selectPreset(_local_3);
        }

        private function onWindowClose(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            hideInterface();
        }

        private function selectPreset(_arg_1:int):void
        {
            if (((((_SafeStr_4981 == null) || (_SafeStr_4981.presets == null)) || (_arg_1 < 0)) || (_arg_1 >= _SafeStr_4981.presets.length)))
            {
                return;
            };
            _SafeStr_4981.selectedPresetIndex = _arg_1;
            var _local_2:DimmerFurniWidgetPresetItem = _SafeStr_4981.presets[_arg_1];
            if (_local_2 == null)
            {
                return;
            };
            selectTab(_arg_1);
            _SafeStr_5976 = _local_2.light;
            if (_SafeStr_5980 != null)
            {
                _SafeStr_5980.setValue(_SafeStr_5976);
            };
            _SafeStr_5977 = colors.indexOf(_local_2.color);
            if (_SafeStr_5979 != null)
            {
                _SafeStr_5979.setSelectedColorIndex(_SafeStr_5977);
            };
            selectedType = _local_2.type;
            _SafeStr_4981.previewCurrentSetting();
        }

        private function selectTab(_arg_1:int):void
        {
            if (_tabContext == null)
            {
                return;
            };
            var _local_2:_SafeStr_3109 = _tabContext.getTabItemAt(_arg_1);
            if (_local_2 != null)
            {
                _tabContext.selector.setSelected((_local_2 as ISelectableWindow));
            };
        }

        private function getSelectedTabIndex():int
        {
            if (_tabContext == null)
            {
                return (-1);
            };
            var _local_1:ISelectableWindow = _tabContext.selector.getSelected();
            return (_tabContext.selector.getSelectableIndex(_local_1));
        }

        private function get windowXML():XML
        {
            if (_windowXML != null)
            {
                return (_windowXML);
            };
            if ((((_SafeStr_4981 == null) || (_SafeStr_4981.assets == null)) || (_SafeStr_4981.assets.getAssetByName("dimmer_ui") == null)))
            {
                return (null);
            };
            var _local_1:XmlAsset = XmlAsset(_SafeStr_4981.assets.getAssetByName("dimmer_ui"));
            _windowXML = XML(_local_1.content);
            return (_windowXML);
        }

        public function get colors():Array
        {
            if (_SafeStr_4981 == null)
            {
                return (null);
            };
            return (_SafeStr_4981.colors);
        }

        public function set selectedType(_arg_1:int):void
        {
            if (((!(_arg_1 == 1)) && (!(_arg_1 == 2))))
            {
                return;
            };
            _SafeStr_5978 = _arg_1;
            var _local_2:_SafeStr_3158 = (_window.findChildByName("type_checkbox") as _SafeStr_3158);
            if (_local_2 != null)
            {
                if (_arg_1 == 2)
                {
                    _local_2.select();
                }
                else
                {
                    _local_2.unselect();
                };
            };
            if (_SafeStr_5980 != null)
            {
                _SafeStr_5980.min = _SafeStr_4981.minLights[(_arg_1 - 1)];
            };
        }

        public function set selectedColorIndex(_arg_1:int):void
        {
            _SafeStr_5977 = _arg_1;
            if (_SafeStr_5979 != null)
            {
                _SafeStr_5979.setSelectedColorIndex(_arg_1);
            };
            _SafeStr_4981.previewCurrentSetting();
        }

        public function set selectedBrightness(_arg_1:int):void
        {
            _SafeStr_5976 = _arg_1;
            if (_SafeStr_5980 != null)
            {
                _SafeStr_5980.setValue(_arg_1);
            };
            _SafeStr_4981.previewCurrentSetting();
        }


    }
}//package com.sulake.habbo.ui.widget.furniture.dimmer

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3158 = "_-RF" (String#812, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5976 = "_-L1x" (String#10742, DoABC#4)
// _SafeStr_5977 = "_-zj" (String#2847, DoABC#4)
// _SafeStr_5978 = "_-yC" (String#18518, DoABC#4)
// _SafeStr_5979 = "_-l1b" (String#3183, DoABC#4)
// _SafeStr_5980 = "_-px" (String#5553, DoABC#4)
// _SafeStr_9017 = "_-mc" (String#17912, DoABC#4)
// _SafeStr_9018 = "_-sm" (String#17974, DoABC#4)


