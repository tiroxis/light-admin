package org.lightadmin.core.web.support;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.io.Serializable;

public class EmbeddedWrapper implements Serializable
{
    private final Object embedded;

    public EmbeddedWrapper(final Object embedded)
    {
        this.embedded = embedded;
    }

    @JsonProperty("_embedded")
    public Object getEmbedded()
    {
        return embedded;
    }
}
