<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" version="1.1.0" xmlns:xlink="http://www.w3.org/1999/xlink" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd" xmlns:se="http://www.opengis.net/se" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <NamedLayer>
    <se:Name>POLARUANG_RTRWBANYUASIN</se:Name>
    <UserStyle>
      <se:Name>POLARUANG_RTRWBANYUASIN</se:Name>
      <se:FeatureTypeStyle>
        <se:Rule>
          <se:Name>Hutan Lindung</se:Name>
          <se:Description>
            <se:Title>Hutan Lindung</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>namobj</ogc:PropertyName>
              <ogc:Literal>Hutan Lindung</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:GraphicFill>
                <se:Graphic>
                  <se:ExternalGraphic>
                    <se:OnlineResource xlink:href="polyygon.png" xlink:type="simple"/>
                    <se:Format>image/png</se:Format>
                  </se:ExternalGraphic>
                  <se:Size>32</se:Size>
                </se:Graphic>
              </se:GraphicFill>
            </se:Fill>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Kawasan Hutan Produksi Tetap</se:Name>
          <se:Description>
            <se:Title>Kawasan Hutan Produksi Tetap</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>namobj</ogc:PropertyName>
              <ogc:Literal>Kawasan Hutan Produksi Tetap</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:GraphicFill>
                <se:Graphic>
                  <se:ExternalGraphic>
                    <se:OnlineResource xlink:href="polyygon_2.png" xlink:type="simple"/>
                    <se:Format>image/png</se:Format>
                  </se:ExternalGraphic>
                  <se:Size>32</se:Size>
                </se:Graphic>
              </se:GraphicFill>
            </se:Fill>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Kawasan Hutan Produksi yang dapat dikonversi</se:Name>
          <se:Description>
            <se:Title>Kawasan Hutan Produksi yang dapat dikonversi</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>namobj</ogc:PropertyName>
              <ogc:Literal>Kawasan Hutan Produksi yang dapat dikonversi</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:GraphicFill>
                <se:Graphic>
                  <se:ExternalGraphic>
                    <se:OnlineResource xlink:href="polyygon_3.png" xlink:type="simple"/>
                    <se:Format>image/png</se:Format>
                  </se:ExternalGraphic>
                  <se:Size>32</se:Size>
                </se:Graphic>
              </se:GraphicFill>
            </se:Fill>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Kawasan Industri</se:Name>
          <se:Description>
            <se:Title>Kawasan Industri</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>namobj</ogc:PropertyName>
              <ogc:Literal>Kawasan Industri</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:GraphicFill>
                <se:Graphic>
                  <se:ExternalGraphic>
                    <se:OnlineResource xlink:href="polyygon_4.png" xlink:type="simple"/>
                    <se:Format>image/png</se:Format>
                  </se:ExternalGraphic>
                  <se:Size>32</se:Size>
                </se:Graphic>
              </se:GraphicFill>
            </se:Fill>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Kawasan Pariwisata</se:Name>
          <se:Description>
            <se:Title>Kawasan Pariwisata</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>namobj</ogc:PropertyName>
              <ogc:Literal>Kawasan Pariwisata</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:GraphicFill>
                <se:Graphic>
                  <se:ExternalGraphic>
                    <se:OnlineResource xlink:href="polyygon_5.png" xlink:type="simple"/>
                    <se:Format>image/png</se:Format>
                  </se:ExternalGraphic>
                  <se:Size>32</se:Size>
                </se:Graphic>
              </se:GraphicFill>
            </se:Fill>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Kawasan Perikanan Budidaya</se:Name>
          <se:Description>
            <se:Title>Kawasan Perikanan Budidaya</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>namobj</ogc:PropertyName>
              <ogc:Literal>Kawasan Perikanan Budidaya</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:GraphicFill>
                <se:Graphic>
                  <se:ExternalGraphic>
                    <se:OnlineResource xlink:href="polyygon_6.png" xlink:type="simple"/>
                    <se:Format>image/png</se:Format>
                  </se:ExternalGraphic>
                  <se:Size>32</se:Size>
                </se:Graphic>
              </se:GraphicFill>
            </se:Fill>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Kawasan Perkebunan</se:Name>
          <se:Description>
            <se:Title>Kawasan Perkebunan</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>namobj</ogc:PropertyName>
              <ogc:Literal>Kawasan Perkebunan</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:GraphicFill>
                <se:Graphic>
                  <se:ExternalGraphic>
                    <se:OnlineResource xlink:href="polyygon_7.png" xlink:type="simple"/>
                    <se:Format>image/png</se:Format>
                  </se:ExternalGraphic>
                  <se:Size>32</se:Size>
                </se:Graphic>
              </se:GraphicFill>
            </se:Fill>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Kawasan Pertambangan Batubara</se:Name>
          <se:Description>
            <se:Title>Kawasan Pertambangan Batubara</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>namobj</ogc:PropertyName>
              <ogc:Literal>Kawasan Pertambangan Batubara</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:GraphicFill>
                <se:Graphic>
                  <se:ExternalGraphic>
                    <se:OnlineResource xlink:href="polyygon_8.png" xlink:type="simple"/>
                    <se:Format>image/png</se:Format>
                  </se:ExternalGraphic>
                  <se:Size>32</se:Size>
                </se:Graphic>
              </se:GraphicFill>
            </se:Fill>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Kawasan Pertambangan Minyak dan Gas Bumi</se:Name>
          <se:Description>
            <se:Title>Kawasan Pertambangan Minyak dan Gas Bumi</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>namobj</ogc:PropertyName>
              <ogc:Literal>Kawasan Pertambangan Minyak dan Gas Bumi</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:GraphicFill>
                <se:Graphic>
                  <se:ExternalGraphic>
                    <se:OnlineResource xlink:href="polyygon_9.png" xlink:type="simple"/>
                    <se:Format>image/png</se:Format>
                  </se:ExternalGraphic>
                  <se:Size>32</se:Size>
                </se:Graphic>
              </se:GraphicFill>
            </se:Fill>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Kawasan Peternakan</se:Name>
          <se:Description>
            <se:Title>Kawasan Peternakan</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>namobj</ogc:PropertyName>
              <ogc:Literal>Kawasan Peternakan</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:GraphicFill>
                <se:Graphic>
                  <se:ExternalGraphic>
                    <se:OnlineResource xlink:href="polyygon_10.png" xlink:type="simple"/>
                    <se:Format>image/png</se:Format>
                  </se:ExternalGraphic>
                  <se:Size>32</se:Size>
                </se:Graphic>
              </se:GraphicFill>
            </se:Fill>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Kawasan Tanaman Pangan</se:Name>
          <se:Description>
            <se:Title>Kawasan Tanaman Pangan</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>namobj</ogc:PropertyName>
              <ogc:Literal>Kawasan Tanaman Pangan</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:GraphicFill>
                <se:Graphic>
                  <se:ExternalGraphic>
                    <se:OnlineResource xlink:href="polyygon_11.png" xlink:type="simple"/>
                    <se:Format>image/png</se:Format>
                  </se:ExternalGraphic>
                  <se:Size>32</se:Size>
                </se:Graphic>
              </se:GraphicFill>
            </se:Fill>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Permukiman Pedesaan</se:Name>
          <se:Description>
            <se:Title>Permukiman Pedesaan</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>namobj</ogc:PropertyName>
              <ogc:Literal>Permukiman Pedesaan</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:GraphicFill>
                <se:Graphic>
                  <se:ExternalGraphic>
                    <se:OnlineResource xlink:href="polyygon_12.png" xlink:type="simple"/>
                    <se:Format>image/png</se:Format>
                  </se:ExternalGraphic>
                  <se:Size>32</se:Size>
                </se:Graphic>
              </se:GraphicFill>
            </se:Fill>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Permukiman Perkotaan</se:Name>
          <se:Description>
            <se:Title>Permukiman Perkotaan</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>namobj</ogc:PropertyName>
              <ogc:Literal>Permukiman Perkotaan</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:GraphicFill>
                <se:Graphic>
                  <se:ExternalGraphic>
                    <se:OnlineResource xlink:href="polyygon_13.png" xlink:type="simple"/>
                    <se:Format>image/png</se:Format>
                  </se:ExternalGraphic>
                  <se:Size>32</se:Size>
                </se:Graphic>
              </se:GraphicFill>
            </se:Fill>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Sempadan Sungai</se:Name>
          <se:Description>
            <se:Title>Sempadan Sungai</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>namobj</ogc:PropertyName>
              <ogc:Literal>Sempadan Sungai</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:GraphicFill>
                <se:Graphic>
                  <se:ExternalGraphic>
                    <se:OnlineResource xlink:href="polyygon_14.png" xlink:type="simple"/>
                    <se:Format>image/png</se:Format>
                  </se:ExternalGraphic>
                  <se:Size>32</se:Size>
                </se:Graphic>
              </se:GraphicFill>
            </se:Fill>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Suaka Margasatwa dan Suaka Margasatwa Laut</se:Name>
          <se:Description>
            <se:Title>Suaka Margasatwa dan Suaka Margasatwa Laut</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>namobj</ogc:PropertyName>
              <ogc:Literal>Suaka Margasatwa dan Suaka Margasatwa Laut</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:GraphicFill>
                <se:Graphic>
                  <se:ExternalGraphic>
                    <se:OnlineResource xlink:href="polyygon_15.png" xlink:type="simple"/>
                    <se:Format>image/png</se:Format>
                  </se:ExternalGraphic>
                  <se:Size>32</se:Size>
                </se:Graphic>
              </se:GraphicFill>
            </se:Fill>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Sungai</se:Name>
          <se:Description>
            <se:Title>Sungai</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>namobj</ogc:PropertyName>
              <ogc:Literal>Sungai</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:GraphicFill>
                <se:Graphic>
                  <se:ExternalGraphic>
                    <se:OnlineResource xlink:href="polyygon_16.png" xlink:type="simple"/>
                    <se:Format>image/png</se:Format>
                  </se:ExternalGraphic>
                  <se:Size>32</se:Size>
                </se:Graphic>
              </se:GraphicFill>
            </se:Fill>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
          <se:Name>Taman Nasional</se:Name>
          <se:Description>
            <se:Title>Taman Nasional</se:Title>
          </se:Description>
          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>namobj</ogc:PropertyName>
              <ogc:Literal>Taman Nasional</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:GraphicFill>
                <se:Graphic>
                  <se:ExternalGraphic>
                    <se:OnlineResource xlink:href="polyygon_17.png" xlink:type="simple"/>
                    <se:Format>image/png</se:Format>
                  </se:ExternalGraphic>
                  <se:Size>32</se:Size>
                </se:Graphic>
              </se:GraphicFill>
            </se:Fill>
          </se:PolygonSymbolizer>
        </se:Rule>
      </se:FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>