// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.game.snowwar.utils.WindowUtils

package com.sulake.habbo.game.snowwar.utils
{
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import com.sulake.core.window.components._SafeStr_3189;
    import flash.display.Bitmap;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.window.components.ITextWindow;

    public class WindowUtils 
    {

        private static var _assets:_SafeStr_21;
        private static var _windowManager:_SafeStr_1695;


        public static function setCaption(_arg_1:_SafeStr_3109, _arg_2:String):void
        {
            var _local_3:* = null;
            _arg_1.caption = _arg_2;
            if ((_arg_1.parent is _SafeStr_3133))
            {
                _local_3 = (_arg_1.parent as _SafeStr_3133).findChildByName((_arg_1.name + "_stroke"));
            };
            if ((_arg_1.parent is IItemListWindow))
            {
                _local_3 = (_arg_1.parent as IItemListWindow).getListItemByName((_arg_1.name + "_stroke"));
            };
            if ((_arg_1.parent is IItemGridWindow))
            {
                _local_3 = (_arg_1.parent as IItemGridWindow).getGridItemByName((_arg_1.name + "_stroke"));
            };
            if (_local_3)
            {
                if (_local_3.caption != _arg_2)
                {
                    _local_3.caption = _arg_2;
                };
            };
        }

        public static function init(_arg_1:_SafeStr_21, _arg_2:_SafeStr_1695):void
        {
            _assets = _arg_1;
            _windowManager = _arg_2;
        }

        public static function setElementImage(_arg_1:_SafeStr_3109, _arg_2:BitmapData, _arg_3:int=0, _arg_4:int=0, _arg_5:int=0):void
        {
            var _local_9:* = null;
            var _local_6:* = null;
            if (_arg_2 == null)
            {
                return;
            };
            if (_arg_1 == null)
            {
                return;
            };
            if (_arg_1.disposed)
            {
                return;
            };
            var _local_10:int = ((_arg_3 > 0) ? _arg_3 : _arg_1.height);
            var _local_7:int = int((((_arg_1.width - _arg_2.width) / 2) + _arg_4));
            var _local_8:int = int((((_local_10 - _arg_2.height) / 2) + _arg_5));
            if ((_arg_1 as _SafeStr_3264) != null)
            {
                _local_9 = _SafeStr_3264(_arg_1);
                if (((_local_9.bitmap == null) || (_arg_3 > 0)))
                {
                    _local_9.bitmap = new BitmapData(_arg_1.width, _local_10, true, 0xFFFFFF);
                };
                _local_9.bitmap.fillRect(_local_9.bitmap.rect, 0xFFFFFF);
                _local_9.bitmap.copyPixels(_arg_2, _arg_2.rect, new Point(_local_7, _local_8), null, null, false);
                _arg_1.invalidate();
            }
            else
            {
                if ((_arg_1 as _SafeStr_3189) != null)
                {
                    _local_6 = _SafeStr_3189(_arg_1);
                    _local_6.setDisplayObject(new Bitmap(_arg_2));
                };
            };
        }

        public static function createWindow(_arg_1:String, _arg_2:int=2):_SafeStr_3109
        {
            HabboGamesCom.log(("CreateWindow: " + _arg_1));
            if (((!(_assets)) || (!(_windowManager))))
            {
                return (null);
            };
            var _local_4:XmlAsset = (_assets.getAssetByName(_arg_1) as XmlAsset);
            if (_local_4 == null)
            {
                HabboGamesCom.log(("CreateWindow() could not find the asset for window: " + _arg_1));
                return (null);
            };
            var _local_5:_SafeStr_3109 = _windowManager.buildFromXML((_local_4.content as XML), _arg_2);
            var _local_3:Array = [];
            if ((_local_5 is _SafeStr_3133))
            {
                (_local_5 as _SafeStr_3133).groupChildrenWithTag("bitmap", _local_3, -1);
            }
            else
            {
                if ((_local_5 is IItemListWindow))
                {
                    (_local_5 as IItemListWindow).groupListItemsWithTag("bitmap", _local_3, -1);
                }
                else
                {
                    if ((_local_5 is IItemGridWindow))
                    {
                    };
                };
            };
            for each (var _local_7:_SafeStr_3109 in _local_3)
            {
                HabboGamesCom.log(("Found child: " + _local_7.name));
            };
            for each (var _local_6:_SafeStr_3264 in _local_3)
            {
                if (_local_6 != null)
                {
                    setDefaultElementImage(_local_6, false);
                };
            };
            return (_local_5);
        }

        private static function setDefaultElementImage(_arg_1:_SafeStr_3264, _arg_2:Boolean):void
        {
            var bmpWindow = _arg_1;
            var active = _arg_2;
            if (!_assets)
            {
                return;
            };
            if (bmpWindow == null)
            {
                return;
            };
            var result:Array = bmpWindow.properties.filter(function (_arg_1:*, _arg_2:int, _arg_3:Array):Boolean
            {
                return (PropertyStruct(_arg_1).key == "bitmap_asset_name");
            });
            var offset:Point = new Point();
            if (((result) && (result.length)))
            {
                var assetName:String = (PropertyStruct(result[0]).value as String);
                HabboGamesCom.log(((("Found Image: " + bmpWindow.name) + " : ") + assetName));
                if (active)
                {
                    assetName = assetName.replace("_on", "");
                };
                var asset:IAsset = _assets.getAssetByName(assetName);
                if (((asset) && (asset is BitmapDataAsset)))
                {
                    bmpWindow.bitmap = new BitmapData(bmpWindow.width, bmpWindow.height, true, 0);
                    var src:BitmapData = (asset.content as BitmapData);
                    offset.x = ((bmpWindow.width - src.width) / 2);
                    offset.y = ((bmpWindow.height - src.height) / 2);
                    bmpWindow.bitmap.copyPixels(src, src.rect, offset);
                };
            };
        }

        public static function hideElement(_arg_1:_SafeStr_3133, _arg_2:String):void
        {
            var _local_4:_SafeStr_3109 = _arg_1.findChildByName(_arg_2);
            if (_local_4)
            {
                _local_4.visible = false;
            };
            var _local_3:_SafeStr_3109 = _arg_1.findChildByName((_arg_2 + "_stroke"));
            if (_local_3)
            {
                _local_3.visible = false;
            };
        }

        public static function colorStrokes(_arg_1:_SafeStr_3109, _arg_2:uint):void
        {
            var _local_3:Array = [];
            if ((_arg_1 is _SafeStr_3133))
            {
                (_arg_1 as _SafeStr_3133).groupChildrenWithTag("stroke", _local_3, 10);
            }
            else
            {
                if ((_arg_1 is IItemListWindow))
                {
                    (_arg_1 as IItemListWindow).groupListItemsWithTag("stroke", _local_3, 10);
                }
                else
                {
                    if ((_arg_1 is IItemGridWindow))
                    {
                    };
                };
            };
            for each (var _local_4:ITextWindow in _local_3)
            {
                if (_local_4 != null)
                {
                    _local_4.textColor = _arg_2;
                };
            };
        }

        public static function showElement(_arg_1:_SafeStr_3133, _arg_2:String):void
        {
            var _local_4:_SafeStr_3109 = _arg_1.findChildByName(_arg_2);
            if (_local_4)
            {
                _local_4.visible = true;
            };
            var _local_3:_SafeStr_3109 = _arg_1.findChildByName((_arg_2 + "_stroke"));
            if (_local_3)
            {
                _local_3.visible = true;
            };
        }


    }
}//package com.sulake.habbo.game.snowwar.utils

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3189 = "_-i1f" (String#1614, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)


