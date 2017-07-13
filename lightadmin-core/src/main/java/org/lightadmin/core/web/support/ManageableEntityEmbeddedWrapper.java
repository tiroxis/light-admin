package org.lightadmin.core.web.support;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import org.springframework.hateoas.core.EmbeddedWrapper;

import java.io.Serializable;

public class ManageableEntityEmbeddedWrapper implements EmbeddedWrapper, Serializable
{
    private static final String REL = "manageable_entity";
    private final ManageableEntity manageableEntity;

    public ManageableEntityEmbeddedWrapper(final ManageableEntity manageableEntity)
    {
        this.manageableEntity = manageableEntity;
    }

    @Override
    @JsonIgnore
    public String getRel()
    {
        return REL;
    }

    @Override
    @JsonIgnore
    public boolean hasRel(final String rel)
    {
        return REL.equals(rel);
    }

    @Override
    @JsonIgnore
    public boolean isCollectionValue()
    {
        return false;
    }

    @Override
    @JsonProperty(REL)
    public Object getValue()
    {
        return manageableEntity;
    }

    @Override
    @JsonIgnore
    public Class<?> getRelTargetType()
    {
        return ManageableEntity.class;
    }
}
