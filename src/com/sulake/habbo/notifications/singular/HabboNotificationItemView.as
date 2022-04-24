// by nota

//com.sulake.habbo.notifications.singular.HabboNotificationItemView

package com.sulake.habbo.notifications.singular
{
    import com.sulake.core.runtime._SafeStr_41;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.assets.IAsset;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.session.events.BadgeImageReadyEvent;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import com.sulake.core.window.components._SafeStr_3216;
    import com.sulake.core.window.events._SafeStr_3116;

    public class HabboNotificationItemView implements _SafeStr_41 
    {

        public static const ITEM_HEIGHT:int = 70;
        public static const SIDE_MARGIN:int = 5;
        private static const STATE_IDLE:int = 0;
        private static const STATE_FADE_IN:int = 1;
        private static const STATE_DISPLAY:int = 2;
        private static const STATE_FADE_OUT:int = 3;

        private var _window:_SafeStr_3109;
        private var _SafeStr_4519:HabboNotificationItem;
        private var _hovering:Boolean = false;
        private var _styleConfig:_SafeStr_24;
        private var _viewConfig:_SafeStr_24;
        private var _SafeStr_6708:uint;
        private var _SafeStr_6710:uint;
        private var _SafeStr_6709:uint;
        private var _margin:int;
        private var _SafeStr_4427:Number;
        private var _resizeMargin:int;
        private var _SafeStr_6711:int;
        private var _SafeStr_3734:int;

        public function HabboNotificationItemView(_arg_1:IAsset, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_24, _arg_4:_SafeStr_24, _arg_5:HabboNotificationItem)
        {
            _styleConfig = _arg_3;
            _viewConfig = _arg_4;
            var _local_6:XmlAsset = (_arg_1 as XmlAsset);
            if (_local_6 == null)
            {
                return;
            };
            _window = _arg_2.buildFromXML((_local_6.content as XML), 1);
            _window.tags.push("notificationview");
            _window.context.getDesktopWindow().addEventListener("WE_RESIZED", onRoomViewResized);
            _window.procedure = onWindowEvent;
            _window.blend = 0;
            _window.visible = false;
            var _local_7:ITextWindow = (_SafeStr_3133(_window).findChildByTag("notification_text") as ITextWindow);
            if (_local_7 != null)
            {
                _resizeMargin = (_window.height - _local_7.bottom);
            }
            else
            {
                _resizeMargin = 15;
            };
            _SafeStr_6711 = _window.height;
            _margin = 4;
            _SafeStr_4427 = 0;
            _SafeStr_3734 = 0;
            showItem(_arg_5);
        }

        public function get disposed():Boolean
        {
            return (_window == null);
        }

        public function get ready():Boolean
        {
            return (_SafeStr_3734 == 0);
        }

        public function get verticalPosition():int
        {
            return (_margin);
        }

        private function showItem(_arg_1:HabboNotificationItem):void
        {
            var _local_2:* = null;
            if (_arg_1 == null)
            {
                return;
            };
            var _local_3:String = _arg_1.content;
            setNotificationText(_local_3);
            if (_arg_1.style.iconAssetUri == null)
            {
                _local_2 = _arg_1.style.icon;
                setNotificationIcon(_local_2);
            }
            else
            {
                IStaticBitmapWrapperWindow(_SafeStr_3133(_window).findChildByTag("notification_icon_static")).assetUri = _arg_1.style.iconAssetUri;
            };
            _SafeStr_4519 = _arg_1;
            reposition();
            startFadeIn();
        }

        public function replaceIcon(_arg_1:BadgeImageReadyEvent):void
        {
            if (_arg_1.badgeId != _SafeStr_4519.style.iconSrc)
            {
                return;
            };
            if (_arg_1.badgeImage != null)
            {
                setNotificationIcon(_arg_1.badgeImage);
            };
        }

        public function update(_arg_1:uint):void
        {
            var _local_2:Number;
            var _local_3:Number;
            switch (_SafeStr_3734)
            {
                case 0:
                    return;
                case 1:
                    _SafeStr_6708 = (_SafeStr_6708 + _arg_1);
                    _local_2 = (_SafeStr_6708 / _viewConfig["time_fade_in"]);
                    if (_SafeStr_6708 > _viewConfig["time_fade_in"])
                    {
                        startDisplay();
                    };
                    adjustBlend(_local_2);
                    return;
                case 2:
                    _SafeStr_6709 = (_SafeStr_6709 + _arg_1);
                    if (((_SafeStr_6709 > _viewConfig["time_display"]) && (!(_hovering))))
                    {
                        startFadeOut();
                    };
                    return;
                case 3:
                    _SafeStr_6710 = (_SafeStr_6710 + _arg_1);
                    _local_3 = (1 - (_SafeStr_6710 / _viewConfig["time_fade_out"]));
                    adjustBlend(_local_3);
                    if (_SafeStr_6710 > _viewConfig["time_fade_in"])
                    {
                        startIdling();
                    };
                default:
            };
        }

        public function dispose():void
        {
            if (_window != null)
            {
                _window.dispose();
                _window = null;
            };
            if (_SafeStr_4519 != null)
            {
                _SafeStr_4519.dispose();
                _SafeStr_4519 = null;
            };
        }

        private function setNotificationText(_arg_1:String):void
        {
            var _local_2:ITextWindow = (_SafeStr_3133(_window).findChildByTag("notification_text") as ITextWindow);
            if (((_local_2 == null) || (_arg_1 == null)))
            {
                return;
            };
            _window.height = 0;
            _local_2.text = _arg_1;
            _local_2.height = (_local_2.textHeight + _resizeMargin);
            if (_window.height < _SafeStr_6711)
            {
                _window.height = _SafeStr_6711;
            };
        }

        private function setNotificationIcon(_arg_1:BitmapData):void
        {
            var _local_6:* = null;
            var _local_5:int;
            var _local_2:int;
            var _local_3:int;
            var _local_4:_SafeStr_3264 = (_SafeStr_3133(_window).findChildByTag("notification_icon") as _SafeStr_3264);
            if (_local_4 == null)
            {
                return;
            };
            if (_arg_1 == null)
            {
                _local_4.bitmap = null;
                return;
            };
            if (((_arg_1.width < _local_4.width) && (_arg_1.height < _local_4.height)))
            {
                _local_6 = new BitmapData(_local_4.width, _local_4.height, true, 0);
                _local_2 = int(((_local_4.width - _arg_1.width) / 2));
                _local_3 = int(((_local_4.height - _arg_1.height) / 2));
                _local_6.copyPixels(_arg_1, _arg_1.rect, new Point(_local_2, _local_3));
            }
            else
            {
                if (_arg_1.width < _arg_1.height)
                {
                    _local_6 = new BitmapData(_arg_1.height, _arg_1.height, true, 0);
                    _local_5 = int(((_arg_1.height - _arg_1.width) / 2));
                    _local_6.copyPixels(_arg_1, _arg_1.rect, new Point(_local_5, 0));
                }
                else
                {
                    if (_arg_1.width > _arg_1.height)
                    {
                        _local_6 = new BitmapData(_arg_1.width, _arg_1.width, true, 0);
                        _local_5 = int(((_arg_1.width - _arg_1.height) / 2));
                        _local_6.copyPixels(_arg_1, _arg_1.rect, new Point(0, _local_5));
                    }
                    else
                    {
                        _local_6 = new BitmapData(_arg_1.width, _arg_1.height);
                        _local_6.copyPixels(_arg_1, _arg_1.rect, new Point(0, 0));
                    };
                };
            };
            _local_4.bitmap = _local_6;
        }

        private function startFadeIn():void
        {
            _SafeStr_6708 = 0;
            _SafeStr_3734 = 1;
            _window.visible = true;
        }

        private function startFadeOut():void
        {
            _SafeStr_6710 = 0;
            _SafeStr_3734 = 3;
        }

        private function startDisplay():void
        {
            _SafeStr_6709 = 0;
            _SafeStr_3734 = 2;
        }

        private function startIdling():void
        {
            _SafeStr_3734 = 0;
            _window.visible = false;
        }

        public function reposition(_arg_1:int=-1):void
        {
            if (_window == null)
            {
                return;
            };
            var _local_2:_SafeStr_3216 = _window.context.getDesktopWindow();
            if (_local_2 == null)
            {
                return;
            };
            if (_arg_1 != -1)
            {
                _margin = _arg_1;
            };
            _window.x = ((_local_2.width - _window.width) - 5);
            _window.y = _margin;
        }

        public function onWindowEvent(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            if (_arg_1.type == "WME_OVER")
            {
                _hovering = true;
            }
            else
            {
                if (_arg_1.type == "WME_OUT")
                {
                    _hovering = false;
                }
                else
                {
                    if (_arg_1.type == "WME_CLICK")
                    {
                        if (_SafeStr_4519 != null)
                        {
                            _SafeStr_4519.ExecuteUiLinks();
                            startFadeOut();
                        };
                    };
                };
            };
        }

        private function onRoomViewResized(_arg_1:_SafeStr_3116):void
        {
            reposition();
        }

        private function adjustBlend(_arg_1:Number):void
        {
            _SafeStr_4427 = _arg_1;
            if (_SafeStr_4427 > 1)
            {
                _SafeStr_4427 = 1;
            };
            if (_SafeStr_4427 < 0)
            {
                _SafeStr_4427 = 0;
            };
            _window.blend = _SafeStr_4427;
        }


    }
}//package com.sulake.habbo.notifications.singular

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3216 = "_-o1L" (String#2319, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3734 = "_-g1U" (String#198, DoABC#4)
// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)
// _SafeStr_4427 = "_-x1" (String#2030, DoABC#4)
// _SafeStr_4519 = "_-yg" (String#3063, DoABC#4)
// _SafeStr_6708 = "_-B1p" (String#8894, DoABC#4)
// _SafeStr_6709 = "_-yy" (String#11233, DoABC#4)
// _SafeStr_6710 = "_-3q" (String#8840, DoABC#4)
// _SafeStr_6711 = "_-016" (String#14968, DoABC#4)


