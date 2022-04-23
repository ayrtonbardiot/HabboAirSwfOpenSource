// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.utils.WindowParser

package com.sulake.core.window.utils
{
    import flash.utils.Dictionary;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.window._SafeStr_3160;
    import com.sulake.core.utils._SafeStr_3288;
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window._SafeStr_3109;
    import flash.geom.Rectangle;
    import flash.filters.BitmapFilter;
    import com.sulake.core.window.components._SafeStr_3382;
    import flash.filters.DropShadowFilter;
    import flash.utils.*;

    public class WindowParser implements _SafeStr_3319 
    {

        public static const ELEMENT_TAG_EXCLUDE:String = "_EXCLUDE";
        public static const ELEMENT_TAG_INCLUDE:String = "_INCLUDE";
        public static const _SafeStr_8256:String = "_TEMP";
        private static const LAYOUT:String = "layout";
        private static const _SafeStr_6696:String = "window";
        private static const VARIABLES:String = "variables";
        private static const FILTERS:String = "filters";
        private static const NAME:String = "name";
        private static const STYLE:String = "style";
        private static const _SafeStr_8257:String = "dynamic_style";
        private static const PARAMS:String = "params";
        private static const TAGS:String = "tags";
        private static const X:String = "x";
        private static const _SafeStr_8082:String = "y";
        private static const WIDTH:String = "width";
        private static const HEIGHT:String = "height";
        private static const VISIBLE:String = "visible";
        private static const CAPTION:String = "caption";
        private static const ID:String = "id";
        private static const BACKGROUND:String = "background";
        private static const BLEND:String = "blend";
        private static const CLIPPING:String = "clipping";
        private static const COLOR:String = "color";
        private static const THRESHOLD:String = "treshold";
        private static const CHILDREN:String = "children";
        private static const WIDTH_MIN:String = "width_min";
        private static const _SafeStr_8258:String = "width_max";
        private static const HEIGHT_MIN:String = "height_min";
        private static const _SafeStr_8259:String = "height_max";
        private static const TRUE:String = "true";
        private static const ZERO:String = "0";
        private static const VAR:String = "$";
        private static const COMMA:String = ",";
        private static const EMPTY:String = "";
        private static const _SafeStr_6120:RegExp = /^(\s|\n|\r|\t|\v)*/m;
        private static const _SafeStr_6119:RegExp = /(\s|\n|\r|\t|\v)*$/;

        protected var _SafeStr_6115:Dictionary;
        protected var _SafeStr_6116:Dictionary;
        protected var _SafeStr_6117:Dictionary;
        protected var _SafeStr_6118:Dictionary;
        protected var _parsedLayoutCache:_SafeStr_24;
        protected var _context:_SafeStr_3160;
        private var _disposed:Boolean = false;

        public function WindowParser(_arg_1:_SafeStr_3160)
        {
            _context = _arg_1;
            _SafeStr_6115 = new Dictionary();
            _SafeStr_6116 = new Dictionary();
            _SafeStr_3383.fillTables(_SafeStr_6115, _SafeStr_6116);
            _SafeStr_6117 = new Dictionary();
            _SafeStr_6118 = new Dictionary();
            _SafeStr_3418.fillTables(_SafeStr_6117, _SafeStr_6118);
            _parsedLayoutCache = new _SafeStr_24();
        }

        private static function trimWhiteSpace(_arg_1:String):String
        {
            _arg_1 = _arg_1.replace(_SafeStr_6119, "");
            return (_arg_1.replace(_SafeStr_6120, ""));
        }


        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function dispose():void
        {
            var _local_1:* = null;
            if (!_disposed)
            {
                for (_local_1 in _SafeStr_6115)
                {
                    delete _SafeStr_6115[_local_1];
                };
                for (_local_1 in _SafeStr_6116)
                {
                    delete _SafeStr_6116[_local_1];
                };
                for (_local_1 in _SafeStr_6117)
                {
                    delete _SafeStr_6117[_local_1];
                };
                for (_local_1 in _SafeStr_6118)
                {
                    delete _SafeStr_6118[_local_1];
                };
                _parsedLayoutCache.dispose();
                _parsedLayoutCache = null;
                _context = null;
                _disposed = true;
            };
        }

        public function parseAndConstruct(_arg_1:XML, _arg_2:_SafeStr_3109, _arg_3:_SafeStr_24):_SafeStr_3109
        {
            var _local_6:uint;
            var _local_13:* = null;
            var _local_8:uint;
            var _local_12:* = null;
            var _local_9:* = null;
            var _local_5:* = null;
            var _local_4:* = null;
            var _local_11:* = null;
            var _local_10:uint;
            if (_arg_1.localName() == "layout")
            {
                _local_9 = _arg_1.child("variables");
                if (_local_9.length() > 0)
                {
                    _local_5 = _local_9[0];
                    var _local_7:XMLList = XML(_local_5[0]).children();
                    if (_local_7.length() > 0)
                    {
                        if (_arg_3 == null)
                        {
                            _arg_3 = new _SafeStr_24();
                        };
                        _SafeStr_3288.parseVariableList(_local_7, _arg_3);
                    };
                };
                _local_4 = _arg_1.child("filters").children();
                if (_local_4.length() > 0)
                {
                    _local_11 = [];
                    _local_10 = 0;
                    while (_local_10 < _local_4.length())
                    {
                        _local_11.push(buildBitmapFilter(_local_4[_local_10]));
                        _local_10++;
                    };
                    _arg_2.filters = _local_11;
                };
                _local_12 = _arg_1.child("window");
                _local_6 = _local_12.length();
                switch (_local_6)
                {
                    case 0:
                        return (null);
                    case 1:
                        _arg_1 = _local_12[0];
                        break;
                    default:
                        _local_8 = 0;
                        while (_local_8 < _local_6)
                        {
                            _local_13 = parseSingleWindowEntity(_local_12[_local_8], WindowController(_arg_2), _arg_3);
                            _local_8++;
                        };
                        return (_local_13);
                };
            };
            if (_arg_1.localName() == "window")
            {
                _local_12 = _arg_1.children();
                _local_6 = _local_12.length();
                if (_local_6 > 1)
                {
                    _local_8 = 0;
                    while (_local_8 < _local_6)
                    {
                        _local_13 = parseSingleWindowEntity(_local_12[_local_8], WindowController(_arg_2), _arg_3);
                        _local_8++;
                    };
                    return (_local_13);
                };
                _arg_1 = _arg_1.children()[0];
            };
            return ((_arg_1 != null) ? parseSingleWindowEntity(_arg_1, WindowController(_arg_2), _arg_3) : null);
        }

        private function parseSingleWindowEntity(_arg_1:XML, _arg_2:WindowController, _arg_3:_SafeStr_24):_SafeStr_3109
        {
            var _local_9:uint;
            var _local_27:* = null;
            var _local_10:* = null;
            var _local_24:* = null;
            var _local_21:* = null;
            var _local_17:uint;
            var _local_18:uint;
            var _local_29:* = null;
            var _local_12:* = null;
            var _local_22:* = null;
            var _local_19:* = null;
            var _local_23:* = null;
            var _local_11:* = null;
            var _local_7:String = "";
            var _local_16:Boolean = true;
            var _local_4:Boolean = true;
            var _local_5:String = "0x00ffffff";
            var _local_6:* = 1;
            var _local_26:Boolean;
            var _local_8:uint = 10;
            var _local_28:uint = ((_arg_2 != null) ? _arg_2.style : 0);
            var _local_25:String = "";
            var _local_20:uint;
            var _local_13:String = "";
            var _local_14:int;
            _local_9 = _SafeStr_6115[_arg_1.localName()];
            _local_27 = unescape(parseAttribute(_arg_1, "name", _arg_3, ""));
            _local_28 = parseAttribute(_arg_1, "style", _arg_3, _local_28);
            _local_25 = String(parseAttribute(_arg_1, "dynamic_style", _arg_3, ""));
            _local_20 = parseAttribute(_arg_1, "params", _arg_3, _local_20);
            _local_13 = unescape(parseAttribute(_arg_1, "tags", _arg_3, _local_13));
            _local_10 = new Rectangle();
            _local_10.x = parseAttribute(_arg_1, "x", _arg_3, "0");
            _local_10.y = parseAttribute(_arg_1, "y", _arg_3, "0");
            _local_10.width = parseAttribute(_arg_1, "width", _arg_3, "0");
            _local_10.height = parseAttribute(_arg_1, "height", _arg_3, "0");
            _local_16 = (parseAttribute(_arg_1, "visible", _arg_3, _local_16.toString()) == "true");
            _local_14 = parseAttribute(_arg_1, "id", _arg_3, _local_14.toString());
            if (_arg_1.child("params").length() > 0)
            {
                _local_21 = _arg_1.child("params").children();
                _local_17 = _local_21.length();
                _local_18 = 0;
                while (_local_18 < _local_17)
                {
                    _local_24 = _local_21[_local_18];
                    _local_12 = (parseAttribute(_local_24, "name", _arg_3, "") as String);
                    if (_SafeStr_6117[_local_12] != null)
                    {
                        _local_20 = (_local_20 | _SafeStr_6117[_local_12]);
                    }
                    else
                    {
                        throw (new Error((('Unknown window parameter "' + _local_24.attribute("name")) + '"!')));
                    };
                    _local_18++;
                };
            };
            _local_7 = ((_local_20 & 0x80000000) ? ((_arg_2) ? _arg_2.caption : "") : "");
            _local_7 = unescape(parseAttribute(_arg_1, "caption", _arg_3, _local_7));
            if (_local_13 != "")
            {
                _local_22 = _local_13.split(",");
                _local_17 = _local_22.length;
                _local_18 = 0;
                while (_local_18 < _local_17)
                {
                    _local_22[_local_18] = WindowParser.trimWhiteSpace(_local_22[_local_18]);
                    _local_18++;
                };
            };
            _local_29 = (_context.create(_local_27, null, _local_9, _local_28, _local_20, _local_10, null, ((_arg_2 is IIterable) ? null : _arg_2), _local_14, parseProperties(_arg_1.child("variables")[0]), _local_25, _local_22) as WindowController);
            if (hasAttribute(_arg_1, "width_min"))
            {
                _local_29.limits.minWidth = parseAttribute(_arg_1, "width_min", _arg_3, _local_29.limits.minWidth);
            };
            if (hasAttribute(_arg_1, "width_max"))
            {
                _local_29.limits.maxWidth = parseAttribute(_arg_1, "width_max", _arg_3, _local_29.limits.maxWidth);
            };
            if (hasAttribute(_arg_1, "height_min"))
            {
                _local_29.limits.minHeight = parseAttribute(_arg_1, "height_min", _arg_3, _local_29.limits.minHeight);
            };
            if (hasAttribute(_arg_1, "height_max"))
            {
                _local_29.limits.maxHeight = parseAttribute(_arg_1, "height_max", _arg_3, _local_29.limits.maxHeight);
            };
            _local_29.limits.limit();
            _local_26 = (parseAttribute(_arg_1, "background", _arg_3, _local_29.background.toString()) == "true");
            _local_6 = parseAttribute(_arg_1, "blend", _arg_3, _local_29.blend.toString());
            _local_4 = (parseAttribute(_arg_1, "clipping", _arg_3, _local_29.clipping.toString()) == "true");
            _local_5 = String(parseAttribute(_arg_1, "color", _arg_3, _local_29.color.toString()));
            _local_8 = parseAttribute(_arg_1, "treshold", _arg_3, _local_29.mouseThreshold.toString());
            if (_local_29.caption != _local_7)
            {
                _local_29.caption = _local_7;
            };
            if (_local_29.blend != _local_6)
            {
                _local_29.blend = _local_6;
            };
            if (_local_29.visible != _local_16)
            {
                _local_29.visible = _local_16;
            };
            if (_local_29.clipping != _local_4)
            {
                _local_29.clipping = _local_4;
            };
            if (_local_29.background != _local_26)
            {
                _local_29.background = _local_26;
            };
            if (_local_29.mouseThreshold != _local_8)
            {
                _local_29.mouseThreshold = _local_8;
            };
            var _local_15:uint = ((_local_5.charAt(1) == "x") ? parseInt(_local_5, 16) : _local_5);
            if (_local_29.color != _local_15)
            {
                _local_29.color = _local_15;
            };
            _local_21 = _arg_1.child("filters").children();
            _local_17 = _local_21.length();
            if (_local_17 > 0)
            {
                _local_19 = [];
                _local_18 = 0;
                while (_local_18 < _local_17)
                {
                    _local_23 = (buildBitmapFilter(_local_21[_local_18]) as BitmapFilter);
                    if (_local_23 != null)
                    {
                        _local_19.push(_local_23);
                    };
                    _local_18++;
                };
                _local_29.filters = _local_19;
            };
            if (_local_29 != null)
            {
                if (_arg_2 != null)
                {
                    if ((_arg_2 is IIterable))
                    {
                        if (((((!(_local_29.x == _local_10.x)) || (!(_local_29.y == _local_10.y))) || (!(_local_29.width == _local_10.width))) || (!(_local_29.height == _local_10.height))))
                        {
                            if ((_local_20 & 0xC0) == 192)
                            {
                                _local_29.x = _local_10.x;
                            };
                            if ((_local_20 & 0x0C00) == 0x0C00)
                            {
                                _local_29.y = _local_10.y;
                            };
                        };
                        try
                        {
                            _local_11 = IIterable(_arg_2).iterator;
                        }
                        catch(e:Error)
                        {
                        };
                        if (_local_11 != null)
                        {
                            _local_11[_local_11.length] = _local_29;
                        }
                        else
                        {
                            _arg_2.addChild(_local_29);
                        };
                    };
                };
            };
            _local_21 = _arg_1.child("children");
            if (_local_21.length() > 0)
            {
                _local_24 = _local_21[0];
                _local_21 = _local_24.children();
                _local_17 = _local_21.length();
                if ((_local_29 is _SafeStr_3382))
                {
                    _SafeStr_3382(_local_29).setAutoRearrange(false);
                };
                _local_18 = 0;
                while (_local_18 < _local_17)
                {
                    parseAndConstruct(_local_21[_local_18], _local_29, _arg_3);
                    _local_18++;
                };
            };
            if ((_local_29 is _SafeStr_3382))
            {
                _SafeStr_3382(_local_29).setAutoRearrange(true);
            };
            return (_local_29);
        }

        private function hasAttribute(_arg_1:XML, _arg_2:String):Boolean
        {
            return (_arg_1.attribute(_arg_2).length() > 0);
        }

        private function parseAttribute(_arg_1:XML, _arg_2:String, _arg_3:_SafeStr_24, _arg_4:Object):Object
        {
            var _local_5:XMLList = _arg_1.attribute(_arg_2);
            if (_local_5.length() == 0)
            {
                return (_arg_4);
            };
            var _local_6:String = String(_local_5);
            if (_arg_3 != null)
            {
                if (_local_6.charAt(0) == "$")
                {
                    _local_6 = _arg_3[_local_6.slice(1, _local_6.length)];
                    if (_local_6 == null)
                    {
                        throw (new Error((('Shared variable not defined: "' + _arg_1.attribute(_arg_2)) + '"!')));
                    };
                };
            };
            return (_local_6);
        }

        private function parseProperties(_arg_1:XML):Array
        {
            return ((_arg_1 != null) ? XMLPropertyArrayParser.parse(_arg_1.children()) : []);
        }

        public function windowToXMLString(_arg_1:_SafeStr_3109):String
        {
            var _local_17:* = null;
            var _local_6:uint;
            var _local_10:* = null;
            var _local_12:* = null;
            var _local_4:* = null;
            if (_arg_1.dynamicStyle.length < 3)
            {
                _arg_1.dynamicStyle = "";
            };
            if (_arg_1.dynamicStyle != "")
            {
                _arg_1.setParamFlag(16, false);
            };
            var _local_11:String = "";
            var _local_7:String = _SafeStr_6116[_arg_1.type];
            var _local_8:uint = _arg_1.param;
            var _local_13:uint = _arg_1.style;
            var _local_14:IRectLimiter = _arg_1.limits;
            var _local_16:WindowController = (_arg_1 as WindowController);
            _local_11 = (_local_11 + ((((((((((((((((((((((((((((((((((("<" + _local_7) + ' x="') + _arg_1.x) + '"') + ' y="') + _arg_1.y) + '"') + ' width="') + _arg_1.width) + '"') + ' height="') + _arg_1.height) + '"') + ' params="') + _arg_1.param) + '"') + ' style="') + _arg_1.style) + '"') + ((_arg_1.dynamicStyle != "") ? ((' dynamic_style="' + _arg_1.dynamicStyle) + '"') : "")) + ((_arg_1.name != "") ? ((' name="' + escape(_arg_1.name)) + '"') : "")) + ((_arg_1.caption != "") ? ((' caption="' + escape(_arg_1.caption)) + '"') : "")) + ((_arg_1.id != 0) ? ((' id="' + _arg_1.id.toString()) + '"') : "")) + ((_arg_1.color != 0xFFFFFF) ? (((' color="0x' + _arg_1.alpha.toString(16)) + _arg_1.color.toString(16)) + '"') : "")) + ((_arg_1.blend != 1) ? ((' blend="' + _arg_1.blend.toString()) + '"') : "")) + ((_arg_1.visible != true) ? ((' visible="' + _arg_1.visible.toString()) + '"') : "")) + ((_arg_1.clipping != true) ? ((' clipping="' + _arg_1.clipping.toString()) + '"') : "")) + ((_arg_1.background != false) ? ((' background="' + _arg_1.background.toString()) + '"') : "")) + ((_arg_1.mouseThreshold != 10) ? ((' treshold="' + _arg_1.mouseThreshold.toString()) + '"') : "")) + ((_arg_1.tags.length > 0) ? ((' tags="' + escape(_arg_1.tags.toString())) + '"') : "")) + ((_local_14.minWidth > -2147483648) ? ((' width_min="' + _local_14.minWidth) + '"') : "")) + ((_local_14.maxWidth < 2147483647) ? ((' width_max="' + _local_14.maxWidth) + '"') : "")) + ((_local_14.minHeight > -2147483648) ? ((' height_min="' + _local_14.minHeight) + '"') : "")) + ((_local_14.maxHeight < 2147483647) ? ((' height_max="' + _local_14.maxHeight) + '"') : "")) + ">\r"));
            if (((_arg_1.filters) && (_arg_1.filters.length > 0)))
            {
                _local_11 = (_local_11 + "\t<filters>\r");
                for each (var _local_9:BitmapFilter in _arg_1.filters)
                {
                    _local_11 = (_local_11 + (("\t\t" + filterToXmlString(_local_9)) + "\r"));
                };
                _local_11 = (_local_11 + "\t</filters>\r");
            };
            var _local_5:uint = _local_16.numChildren;
            var _local_2:String = "";
            if ((_local_16 is IIterable))
            {
                _local_10 = IIterable(_local_16).iterator;
                _local_5 = _local_10.length;
                if (_local_5 > 0)
                {
                    _local_6 = 0;
                    while (_local_6 < _local_5)
                    {
                        _local_17 = (_local_10[_local_6] as _SafeStr_3109);
                        if (_local_17.tags.indexOf("_EXCLUDE") == -1)
                        {
                            _local_2 = (_local_2 + windowToXMLString(_local_17));
                        };
                        _local_6++;
                    };
                };
            }
            else
            {
                _local_5 = _local_16.numChildren;
                if (_local_5 > 0)
                {
                    _local_6 = 0;
                    while (_local_6 < _local_5)
                    {
                        _local_17 = _local_16.getChildAt(_local_6);
                        if (_local_17.tags.indexOf("_EXCLUDE") == -1)
                        {
                            _local_2 = (_local_2 + windowToXMLString(_local_17));
                        };
                        _local_6++;
                    };
                };
            };
            if (_local_2.length > 0)
            {
                _local_11 = (_local_11 + (("\t<children>\r" + _local_2) + "\t</children>\r"));
            };
            var _local_15:Array = _arg_1.properties;
            if (((!(_local_15 == null)) && (_local_15.length > 0)))
            {
                _local_4 = "\t<variables>\r";
                var _local_3:Boolean = false;
                _local_6 = 0;
                while (_local_6 < _local_15.length)
                {
                    _local_12 = (_local_15[_local_6] as PropertyStruct);
                    if (_local_12.valid)
                    {
                        _local_4 = (_local_4 + (("\t\t" + _local_12.toXMLString()) + "\r"));
                        _local_3 = true;
                    };
                    _local_6++;
                };
                _local_4 = (_local_4 + "\t</variables>\r");
                if (_local_3)
                {
                    _local_11 = (_local_11 + _local_4);
                };
            };
            _local_11 = (_local_11 + (("</" + _local_7) + ">\r"));
            return (_local_11);
        }

        private function buildBitmapFilter(_arg_1:XML):BitmapFilter
        {
            var _local_2:* = null;
            var _local_3:String = (_arg_1.localName() as String);
            switch (_local_3)
            {
                case "DropShadowFilter":
                    _local_2 = new DropShadowFilter(parseAttribute(_arg_1, "distance", null, "0"), parseAttribute(_arg_1, "angle", null, "45"), parseAttribute(_arg_1, "color", null, "0"), parseAttribute(_arg_1, "alpha", null, "1"), parseAttribute(_arg_1, "blurX", null, "0"), parseAttribute(_arg_1, "blurY", null, "0"), parseAttribute(_arg_1, "strength", null, "1"), parseAttribute(_arg_1, "quality", null, "1"), (parseAttribute(_arg_1, "inner", null, "false") == "true"), (parseAttribute(_arg_1, "knockout", null, "false") == "true"), (parseAttribute(_arg_1, "hideObject", null, "false") == "true"));
            };
            return (_local_2);
        }

        private function filterToXmlString(_arg_1:BitmapFilter):String
        {
            var _local_2:String;
            if ((_arg_1 is DropShadowFilter))
            {
                _local_2 = "<DropShadowFilter";
                _local_2 = (_local_2 + ((DropShadowFilter(_arg_1).distance != 0) ? ((' distance="' + DropShadowFilter(_arg_1).distance) + '"') : ""));
                _local_2 = (_local_2 + ((DropShadowFilter(_arg_1).angle != 45) ? ((' angle="' + DropShadowFilter(_arg_1).angle) + '"') : ""));
                _local_2 = (_local_2 + ((DropShadowFilter(_arg_1).color != 0) ? ((' color="' + DropShadowFilter(_arg_1).color) + '"') : ""));
                _local_2 = (_local_2 + ((DropShadowFilter(_arg_1).alpha != 1) ? ((' alpha="' + DropShadowFilter(_arg_1).alpha) + '"') : ""));
                _local_2 = (_local_2 + ((DropShadowFilter(_arg_1).blurX != 0) ? ((' blurX="' + DropShadowFilter(_arg_1).blurX) + '"') : ""));
                _local_2 = (_local_2 + ((DropShadowFilter(_arg_1).blurY != 0) ? ((' blurY="' + DropShadowFilter(_arg_1).blurY) + '"') : ""));
                _local_2 = (_local_2 + ((DropShadowFilter(_arg_1).strength != 1) ? ((' strength="' + DropShadowFilter(_arg_1).strength) + '"') : ""));
                _local_2 = (_local_2 + ((DropShadowFilter(_arg_1).quality != 1) ? ((' quality="' + DropShadowFilter(_arg_1).quality) + '"') : ""));
                _local_2 = (_local_2 + ((DropShadowFilter(_arg_1).inner != false) ? ((' inner="' + DropShadowFilter(_arg_1).inner) + '"') : ""));
                _local_2 = (_local_2 + ((DropShadowFilter(_arg_1).knockout != false) ? ((' knockout="' + DropShadowFilter(_arg_1).knockout) + '"') : ""));
                _local_2 = (_local_2 + ((DropShadowFilter(_arg_1).hideObject != false) ? ((' hideObject="' + DropShadowFilter(_arg_1).hideObject) + '"') : ""));
                _local_2 = (_local_2 + " />");
            };
            return (_local_2);
        }


    }
}//package com.sulake.core.window.utils

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3160 = "_-dQ" (String#2821, DoABC#4)
// _SafeStr_3288 = "_-32u" (String#6754, DoABC#4)
// _SafeStr_3319 = "_-Kx" (String#11293, DoABC#4)
// _SafeStr_3382 = "_-O13" (String#7685, DoABC#4)
// _SafeStr_3383 = "_-pn" (String#14966, DoABC#4)
// _SafeStr_3418 = "_-DE" (String#22694, DoABC#4)
// _SafeStr_6115 = "_-y1e" (String#11029, DoABC#4)
// _SafeStr_6116 = "_-DP" (String#10398, DoABC#4)
// _SafeStr_6117 = "_-U1D" (String#9577, DoABC#4)
// _SafeStr_6118 = "_-dG" (String#13458, DoABC#4)
// _SafeStr_6119 = "_-12H" (String#20715, DoABC#4)
// _SafeStr_6120 = "_-WV" (String#19180, DoABC#4)
// _SafeStr_6696 = "_-vq" (String#8627, DoABC#4)
// _SafeStr_8082 = "_-n1M" (String#24348, DoABC#4)
// _SafeStr_8256 = "_-5z" (String#38751, DoABC#4)
// _SafeStr_8257 = "_-bq" (String#31727, DoABC#4)
// _SafeStr_8258 = "_-81w" (String#33230, DoABC#4)
// _SafeStr_8259 = "_-1f" (String#38572, DoABC#4)


