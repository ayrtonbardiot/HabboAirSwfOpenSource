// by nota

//com.sulake.habbo.catalog.viewer.ProductGridItem

package com.sulake.habbo.catalog.viewer
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.IInteractiveWindow;
    import com.sulake.core.window.events._SafeStr_3116;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import com.sulake.habbo.avatar._SafeStr_3138;
    import com.sulake.habbo.avatar._SafeStr_1875;

    public class ProductGridItem implements _SafeStr_3266 
    {

        public static const GRID_ITEM_BORDER:String = "bg";

        protected var _SafeStr_3882:_SafeStr_3133;
        private var _SafeStr_5384:IItemGrid;
        protected var _icon:_SafeStr_3264;
        private var _disposed:Boolean = false;
        private var _SafeStr_5385:Object;
        private var _catalog:HabboCatalog;

        public function ProductGridItem(_arg_1:HabboCatalog)
        {
            _catalog = _arg_1;
            super();
        }

        public function get view():_SafeStr_3133
        {
            return (_SafeStr_3882);
        }

        public function set grid(_arg_1:IItemGrid):void
        {
            _SafeStr_5384 = _arg_1;
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            _disposed = true;
            _SafeStr_5384 = null;
            _icon = null;
            _catalog = null;
            if (_SafeStr_3882 != null)
            {
                _SafeStr_3882.dispose();
                _SafeStr_3882 = null;
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        protected function get catalog():HabboCatalog
        {
            return (_catalog);
        }

        public function activate():void
        {
            if (!_SafeStr_3882)
            {
                return;
            };
            if (_SafeStr_3882.findChildByTag("ITEM_HILIGHT"))
            {
                _SafeStr_3882.findChildByTag("ITEM_HILIGHT").visible = true;
            }
            else
            {
                _SafeStr_3882.getChildByName("bg").style = 0;
            };
        }

        public function deactivate():void
        {
            if (!_SafeStr_3882)
            {
                return;
            };
            if (_SafeStr_3882.findChildByTag("ITEM_HILIGHT"))
            {
                _SafeStr_3882.findChildByTag("ITEM_HILIGHT").visible = false;
            }
            else
            {
                _SafeStr_3882.getChildByName("bg").style = 3;
            };
        }

        public function set view(_arg_1:_SafeStr_3133):void
        {
            if (!_arg_1)
            {
                return;
            };
            _SafeStr_3882 = _arg_1;
            _SafeStr_3882.procedure = eventProc;
            _icon = (_SafeStr_3882.findChildByName("image") as _SafeStr_3264);
            if (_SafeStr_3882.findChildByTag("ITEM_HILIGHT"))
            {
                _SafeStr_3882.findChildByTag("ITEM_HILIGHT").visible = false;
            };
            var _local_2:_SafeStr_3109 = _SafeStr_3882.findChildByName("multiContainer");
            if (_local_2)
            {
                _local_2.visible = false;
            };
        }

        public function setDraggable(_arg_1:Boolean):void
        {
            if (((_SafeStr_3882 as IInteractiveWindow) && (_arg_1)))
            {
                (_SafeStr_3882 as IInteractiveWindow).setMouseCursorForState(4, 5);
                (_SafeStr_3882 as IInteractiveWindow).setMouseCursorForState((0x04 | 0x01), 5);
            };
        }

        private function eventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:Boolean;
            if (_arg_1.type == "WME_UP")
            {
                _SafeStr_5385 = null;
            }
            else
            {
                if (_arg_1.type == "WME_DOWN")
                {
                    if (_arg_2 == null)
                    {
                        return;
                    };
                    _SafeStr_5384.select(this, true);
                    _SafeStr_5385 = _arg_2;
                }
                else
                {
                    if ((((_arg_1.type == "WME_OUT") && (!(_SafeStr_5385 == null))) && (_SafeStr_5385 == _arg_2)))
                    {
                        _local_3 = _SafeStr_5384.startDragAndDrop(this);
                        if (_local_3)
                        {
                            _SafeStr_5385 = null;
                        };
                    }
                    else
                    {
                        if (_arg_1.type == "WME_UP")
                        {
                            _SafeStr_5385 = null;
                        }
                        else
                        {
                            if (_arg_1.type == "WME_CLICK")
                            {
                                _SafeStr_5385 = null;
                            }
                            else
                            {
                                if (_arg_1.type == "WME_DOUBLE_CLICK")
                                {
                                    _SafeStr_5385 = null;
                                };
                            };
                        };
                    };
                };
            };
        }

        public function setIconImage(_arg_1:BitmapData, _arg_2:Boolean):void
        {
            var _local_3:int;
            var _local_4:int;
            if (_arg_1 == null)
            {
                return;
            };
            if (((!(_icon == null)) && (!(_icon.disposed))))
            {
                _local_3 = int(((_icon.width - _arg_1.width) / 2));
                _local_4 = int(((_icon.height - _arg_1.height) / 2));
                if (_icon.bitmap == null)
                {
                    _icon.bitmap = new BitmapData(_icon.width, _icon.height, true, 0xFFFFFF);
                }
                else
                {
                    _icon.bitmap.fillRect(_icon.bitmap.rect, 0xFFFFFF);
                };
                _icon.bitmap.copyPixels(_arg_1, _arg_1.rect, new Point(_local_3, _local_4), null, null, false);
                _icon.invalidate();
            };
            if (_arg_2)
            {
                _arg_1.dispose();
            };
        }

        protected function renderAvatarImage(_arg_1:String, _arg_2:_SafeStr_1875):BitmapData
        {
            var _local_4:_SafeStr_3138 = _catalog.avatarRenderManager.createAvatarImage(_arg_1, "h", null, _arg_2);
            var _local_3:BitmapData = _local_4.getCroppedImage("head", 0.5);
            _local_4.dispose();
            return (_local_3);
        }


    }
}//package com.sulake.habbo.catalog.viewer

// _SafeStr_1875 = "_-R1S" (String#2190, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3138 = "_-L1S" (String#1270, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3266 = "_-j1x" (String#3177, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_5384 = "_-Ng" (String#1406, DoABC#4)
// _SafeStr_5385 = "_-r2" (String#2973, DoABC#4)


